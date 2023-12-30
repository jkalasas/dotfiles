{ config, pkgs, ... }:
let
  wayland-discord = pkgs.writeShellScriptBin "discord" ''
    exec ${pkgs.discord}/bin/discord --enable-features=UseOzonePlatform --ozone-platform=wayland
  '';
in
pkgs.symlinkJoin
{
  name = "discord";
  paths = [
    wayland-discord
    pkgs.discord
  ];
}
{
  home.packages = [ wayland-discord ];
}
