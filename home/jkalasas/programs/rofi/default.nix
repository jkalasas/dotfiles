{ config, pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    terminal = "alacritty";
  };

    home.file."${config.xdg.configHome}/rofi" = {
      source = ./configs;
      recursive = true;
    };
}
