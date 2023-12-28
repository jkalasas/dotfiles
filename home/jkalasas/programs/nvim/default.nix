{ config, libs, pkgs, ... }:
{
  programs.nixvim = {
    enable = true;

    colorschemes.gruvbox.enable = true;
  };
}
