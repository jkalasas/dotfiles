{ config, lib, pkgs, ... }:
let
  start-recorder = pkgs.writeShellScriptBtn "start-recorder" ''
    rasi_config="$HOME/.config/rofi/screenshot.rasi"
    rofi_command="rofi -theme $rasi_config"

    time=`date +%Y-%m-%d-%I-%M-%S`
    dir="`xdg-user-dir VIDEOS`/Recorded"
    filename="Recorded_''${time}.mp4"
    full-path="''${dir}/''${filename}"

    pid=799

    # Buttons
    layout=`cat $rasi_config | grep BUTTON | cut -d'=' -f2 | tr -d '[:blank:],*/'`
    if [[ "$layout" == "TRUE" ]]; then
    	screen="󰍹 "
    	area="󰹑 "
    	infive="󰔝 "
    	inten="󰔜 "
    else
    	screen="󰍹  Record Desktop"
    	area="󰹑  Record Area"
    	infive="󰔝  Take in 3s"
    	inten="󰔜  Take in 10s"
    fi

    # Notify and view screenshot
    notify_view () {
    	if [[ -e $full_path ]]; then
    		dunstify -u low --replace=$pid "Record Saved."
    	else
    		dunstify -u low --replace=$pid "Record Deleted."
    	fi
    }

    # countdown
    countdown () {
    	for sec in `seq $1 -1 1`; do
    		dunstify -t 1000 --replace=$pid "Taking shot in : $sec"
    		sleep 1
    	done
    }

    # take shots
    shotnow () {
      sleep 1
      wf-recorder -c libx264rgb -f $full-path
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
      wf-recorder -g "$(slurp)" -c libx264rgb -f $full-path
      notify_view
    }

    if [[ ! -d "$dir" ]]; then
    	mkdir -p "$dir"
    fi

    # Variable passed to rofi
    options="$screen\n$area\n$infive\n$inten"

    chosen="$(echo -e "$options" | $rofi_command -p 'Record Screen' -dmenu -selected-row 0)"
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
    slurp
    wf-recorder

    # script
    start-recorder
  ];
}
