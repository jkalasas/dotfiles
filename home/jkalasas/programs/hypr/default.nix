{ config, lib, pkgs, ... }:

{
  imports = [
    ./hyprland-environment.nix
  ];
  home.packages = with pkgs; [
    imagemagick
    swayidle
    xwaylandvideobridge
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
  };

  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$browser" = "firefox";
    "$lockfile" = "~/.cache/lockscreen.png";
    "$lockcommand" = "grim $lockfile; convert $lockfile -blur 0x4 $lockfile; swaylock --image $lockfile";
    "$launcher" = "rofi-launcher";
    "$terminal" = "alacritty";
    bind = [
      ",Print,exec,screenshot"
      ",XF86AudioMicMute,exec,pamixer --default-source -t"
      ",XF86MonBrightnessDown,exec,brightnessctl s 10%-"
      ",XF86MonBrightnessUp,exec,brightnessctl s +10%"
      ",XF86AudioMute,exec,pamixer -t"
      ",XF86AudioLowerVolume,exec,pamixer -d 10"
      ",XF86AudioRaiseVolume,exec,pamixer -i 10"
      ",XF86AudioPlay,exec,playerctl play-pause"
      ",XF86AudioPause,exec,playerctl play-pause"

      "$mod SHIFT, Q, exec, rofi-powermenu"
      "$mod SHIFT, X, killactive"
      "$mod, mouse_down, workspace, e+1"
      "$mod, mouse_up, workspace, e-1"
      "$mod, F, fullscreen"
      "$mod, T, toggleFloating"

      "$mod, RETURN, exec, $terminal"
      "$mod, B, exec, $browser"
      "$mod, P, exec, $launcher"

      # window navigation
      "$mod, left, movefocus, l"
      "$mod, H, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, L, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, K, movefocus, u"
      "$mod, down, movefocus, d"
      "$mod, J, movefocus, d"

      # scratchpad
      "$mod, S, togglespecialworkspace, magic"
      "$mod SHIFT, S, movetoworkspace, special:magic"
    ] ++ (
      builtins.concatLists (builtins.genList
        (
          x:
          let
            ws =
              let
                c = (x + 1) / 10;
              in
              builtins.toString (x + 1 - (c * 10));
          in
          [
            "$mod, ${ws}, workspace, ${toString(x + 1)}"
            "$mod SHIFT, ${ws}, movetoworkspace, ${toString(x + 1)}"
          ]
        )
        10)
    );
    bindl = [
      ",switch:Lid Switch, exec, $lockcommand"
    ];
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    decoration = {
      rounding = 5;
    };

    exec-once = [
      "blueman-applet"
      "nm-applet"
      "swww init"
      "swayidle -w timeout 1200 \"$lockcommand\" timeout 1800 \"hyprctl dispatch dpms off\" resume \"hyprctl dispatch dpms on\""
    ];

    exec = [
      "sleep 5; wallpaper-set"
    ];

    input.kb_layout = "us";
    input.touchpad = {
      natural_scroll = true;
    };

    general = {
      gaps_in = 5;
      gaps_out = 5;
      border_size = 1;
      layout = "dwindle";
      allow_tearing = false;
    };

    gestures = {
      workspace_swipe = true;
      workspace_swipe_fingers = 4;
    };

    windowrule = [
      "float,^(pavucontrol)"
      "center,^(pavucontrol)"
      "float,^(mpv)"
      "center,^(mpv)"
      "float,^(ymuse)"
      "center,^(ymuse)"
    ];

    windowrulev2 = [
      "opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$"
      "noanim,class:^(xwaylandvideobridge)$"
      "nofocus,class:^(xwaylandvideobridge)$"
      "noinitialfocus,class:^(xwaylandvideobridge)$"
    ];
  };
}
