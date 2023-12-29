{ config, pkgs, lib, ... }:
{
  home.file."${config.xdg.configHome}/alacritty/catppuccin_macchiato.yml" = {
    source = ./catppuccin_macchiato.yml;
  };

  programs.alacritty = {
    enable = true;
    settings = {
      import = [
        "${config.xdg.configHome}/alacritty/catppuccin_macchiato.yml"
      ];

      font = {
        normal = {
          family = "JetBrainsMono Nerd Font Mono";
          style = "Regular";
        };
        size = 10;
      };

      window = {
        padding = {
          x = 12;
          y = 12;
        };
        opacity = 0.8;
      };
    };
  };
}
