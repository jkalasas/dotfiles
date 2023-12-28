{ config, lib, pkgs, ... }:
{
  programs.neovim = 
  let
    getFile = file: "${builtins.readFile file}";
  in
  {
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

     plugins = with pkgs.vimPlugins; [
       {
         plugin = catppuccin-nvim;
         type = "lua";
         config = getFile ./config/plugins/catppuccin.lua;
       }
	   {
	     plugin = comment-nvim;
		 type = "lua";
		 config = "require(\"Comment\").setup()";
	   }
	   {
	     plugin = telescope-nvim;
		 type = "lua";
		 config = getFile ./config/plugins/telescope.lua};
	   }
	   telescope-fzf-native-nvim
	   vim-nix
	 ];

     extraLuaConfig = getFile ./config/options.lua;
  };
}

# thanks to vimjoyer <3
