{ config, lib, pkgs, ... }:
{
  imports = [
    ./virtualization
  ];

  programs.regreet.enable = true;
  services.greetd.enable = true;
  services.xserver.displayManager.session = [
    {
      manage = "desktop";
      name = "Hyprland";
      start = "/etc/profiles/per-user/jkalasas/bin/Hyprland";
    }
  ];

  programs.dconf.enable = true;

  security.pam.services.swaylock = {
    text = ''
      auto include login
    '';
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config.common.default = "*";
  };
}
