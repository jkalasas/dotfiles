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

	 plugins = with pkgs.vimPlugins; [
	   {
	     plugin = comment-nvim;
		 type = "lua";
		 config = "require(\"Comment\").setup()";
	   }
	   {
	     plugin = telescope-nvim;
		 type = "lua";
		 config = "${builtins.readFile ./config/plugins/telescope.lua}";
	   }
	   telescope-fzf-native-nvim
	   vim-nix
	 ];

     extraLuaConfig = ''
       ${builtins.readFile ./config/options.lua}
     '';
  };
}

# thanks to vimjoyer <3
