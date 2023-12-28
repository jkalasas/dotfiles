{ config, pkgs, lib, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      import = [
        pkgs.alacritty-theme.catppuccin_macchiato
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
