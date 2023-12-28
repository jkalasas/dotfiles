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
	  family = "Hack";
	  style = "Medium";
	};
	size = 10;
      };

      window = {
        padding = {
	  x = 12;
	  y = 12;
	};
      };

      shell = {
        program = "/usr/bin/env zsh";
      };
    };
  };
}
