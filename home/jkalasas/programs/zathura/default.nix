{ config, pkgs, ... }:
{
  home.file."${config.xdg.configHome}/zathura/catppuccin-macchiato".source = ./catppuccin-macchiato;

  programs.zathura = {
    enable = true;

    extraConfig = ''
      set selection-clipboard clipboard

      include catppuccin-macchiato
    '';
  };
}
