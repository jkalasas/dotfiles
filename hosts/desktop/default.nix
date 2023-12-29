{ config, lib, pkgs, ... }:
{
  imports = [
    ./virtualization
  ];

  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "/etc/profiles/per-user/jkalasas/bin/Hyprland";
        user = "jkalasas";
      };
      default_session = initial_session;
    };
  };

  services.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        governor = "balance";
        turbo = "auto";
      };

      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
  };

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
