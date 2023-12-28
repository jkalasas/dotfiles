{ config, lib, pkgs, ... }:

let
  rofi-launcher = pkgs.writeShellScriptBin "rofi-launcher" ''
    #!/usr/bin/env bash
    rofi \
    	-show drun \
    	-modi run,drun,ssh \
    	-scroll-method 0 \
    	-drun-match-fields all \
    	-drun-display-format "{name}" \
    	-no-drun-show-actions \
    	-terminal alacritty \
    	-theme "$HOME"/.config/rofi/launcher.rasi
  '';
  wallpaper-set = pkgs.writeShellScriptBin "wallpaper-set" ''
    #!/usr/bin/env bash
    swww img ${config.xdg.configHome}/scripts/wallpapers/animated-city.gif
  '';
in
{
  imports = [ 
    ./powermenu.nix
    ./screenshot.nix 
  ];

  home.file."${config.xdg.configHome}/scripts/wallpapers" = {
    source = ./wallpapers;
    recursive = true;
  };

  home.packages = with pkgs; [
    swww

    # scripts
    rofi-launcher
    wallpaper-set
  ];
}
