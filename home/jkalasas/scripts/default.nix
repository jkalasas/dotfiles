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
in
{
  home.packages = with pkgs; [
    rofi-launcher
  ];
}
