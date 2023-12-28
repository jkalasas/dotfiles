{ config, lib, pkgs, ... }:
{
  programs.neovim = {
    enable = true;

     viAlias = true;
     vimAlias = true;
     vimdiffAlias = true;

     extraPackages = with pkgs; [
       lua-language-server
       rnix-lsp

       xclip
       wl-clipboard
     ];

     extraLuaConfig = ''
       ${builtins.readFile ./config/options.lua}
     '';
  };
}
