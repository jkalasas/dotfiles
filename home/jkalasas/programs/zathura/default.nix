{ config, pkgs, ... }:
{
  home.file."${config.xdg.configHome}/zathura/catppuccin-macchiato".source = ./catppuccin-macchiato;

  programs.zathura = {
    enable = true;

    extraConfig = ''
      include catppuccin-macchiato
    '';
  };
}
