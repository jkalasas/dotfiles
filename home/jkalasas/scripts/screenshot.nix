{ config, lib, pkgs, ... }:
let
  screenshot = pkgs.writeShellScriptBin "screenshot" ''
    #!/usr/bin/env bash
    rasi_config="$HOME/.config/rofi/screenshot.rasi"
    rofi_command="rofi -theme $rasi_config"

    time=`date +%Y-%m-%d-%I-%M-%S`
    geometry=`xrandr | head -n1 | cut -d',' -f2 | tr -d '[:blank:],current'`
    dir="`xdg-user-dir PICTURES`/Screenshots"
    file="Screenshot_''${time}_''${geometry}.png"
    full_path="''${dir}/$file"

    # Buttons
    layout=`cat $rasi_config | grep BUTTON | cut -d'=' -f2 | tr -d '[:blank:],*/'`
    if [[ "$layout" == "TRUE" ]]; then
    	screen="󰍹 "
    	area="󰹑 "
    	infive="󰔝 "
    	inten="󰔜 "
    else
    	screen="󰍹  Capture Desktop"
    	area="󰹑  Capture Area"
    	infive="󰔝  Take in 3s"
    	inten="󰔜  Take in 10s"
    fi

    # Notify and view screenshot
    notify_view () {
    	dunstify -u low --replace=699 "Copied to clipboard."
    	eog $full_path
    	if [[ -e $full_path ]]; then
    		dunstify -u low --replace=699 "Screenshot Saved."
    	else
    		dunstify -u low --replace=699 "Screenshot Deleted."
    	fi
    }

    # countdown
    countdown () {
    	for sec in `seq $1 -1 1`; do
    		dunstify -t 1000 --replace=699 "Taking shot in : $sec"
    		sleep 1
    	done
    }

    # take shots
    shotnow () {
      sleep 1
      grim $full_path
      wl-copy < $full_path
      notify_view
    }

    shot5 () {
      countdown '3'
      shotnow
    }

    shot10 () {
      countdown '10'
      shownow
    }

    shotarea () {
      grim -g "$(slurp)" $full_path
      wl-copy < $full_path
      notify_view
    }

    if [[ ! -d "$dir" ]]; then
    	mkdir -p "$dir"
    fi

    # Variable passed to rofi
    options="$screen\n$area\n$infive\n$inten"

    chosen="$(echo -e "$options" | $rofi_command -p 'Take A Shot' -dmenu -selected-row 0)"
    case $chosen in
        $screen)
    		shotnow
            ;;
        $area)
    		shotarea
            ;;
        $infive)
    		shot5
    		;;
        $inten)
    		shot10
            ;;
    esac
  '';
in
{
  home.packages = with pkgs; [
    # nix
    grim
    slurp
    wl-clipboard

    # script
    screenshot
  ];
}
