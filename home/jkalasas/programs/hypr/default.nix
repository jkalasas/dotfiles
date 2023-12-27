{ config, lib, pkgs, ... }:

{
  imports = [
    ./hyprland-environment.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
  };

  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$browser" = "firefox";
    "$terminal" = "alacritty";
    bind = [
      "$mod SHIFT, Q, exit"
      "$mod SHIFT, X, killactive"
      "$mod, mouse_down, workspace, e+1"
      "$mod, mouse_up, workspace, e-1"
      "$mod, T, toggleFloating"
      "$mod, B, exec, $browser"
      "$mod, RETURN, exec, $terminal"

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
      builtins.concatLists(builtins.genList(
        x: let
	  ws = let
	    c = (x + 1) / 10;
          in
	    builtins.toString(x + 1 - (c * 10));
       in [
         "$mod, ${ws}, workspace, ${toString(x + 1)}"
	 "$mod SHIFT, ${ws}, movetoworkspace, ${toString(x + 1)}"
       ]
      )
      10)
    );
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
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
  };
}
