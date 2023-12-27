{ config, lib, pkgs, ... }:

{
  imports = [
    ./hyprland-environment.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
  };
}
