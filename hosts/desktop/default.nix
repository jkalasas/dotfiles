{ config, lib, pkgs, ... }:
{
  imports = [
    ./virtualization
  ];

  programs.regreet.enable = true;
  services.greetd = {
    enable = true;
    settings = {
      initial_session = {
        user = "jkalasas";
	command = "$SHELL -l";
      };
    };
  };
  services.xserver.displayManager.session = [
    {
      manage = "desktop";
      name = "Hyprland";
      start = "/etc/profiles/per-user/jkalasas/bin/Hyprland";
    }
  ];

  programs = {
    bash = {
      interactiveShellInit = ''
        if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
           Hyprland        
	fi
      '';
    };
  };

  programs.dconf.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config.common.default = "*";
  };
}
