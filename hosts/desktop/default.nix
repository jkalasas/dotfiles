{ config, lib, pkgs, ... }:
{
  imports = [
    ./virtualization
  ];

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.bluetooth.settings = {
    General = {
      Experimental = true;
    };
  };

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

  services.gvfs.enable = true;
  services.tumbler.enable = true;

  programs.dconf.enable = true;

  security.pam.services.swaylock = {
    text = ''
      auto include login
    '';
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
    ];
    config.common.default = "*";
  };
}
