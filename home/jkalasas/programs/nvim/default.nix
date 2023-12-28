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

       cmp_luasnip
       cmp-nvim-lsp
       luasnip
       {
         plugin = nvim-cmp;
         type = "lua";
         config = getFile ./config/plugins/cmp.lua;
       }

       {
         plugin = nvim-lspconfig;
         type = "lua";
         config = getFile ./config/plugins/lsp.lua;
       }

       neodev-nvim

	   {
	     plugin = telescope-nvim;
		 type = "lua";
		 config = getFile ./config/plugins/telescope.lua;
	   }
	   telescope-fzf-native-nvim

       {
         plugin = (nvim-treesitter.withPlugins (p: [
           p.tree-sitter-nix
           p.tree-sitter-vim
           p.tree-sitter-bash
           p.tree-sitter-lua
           p.tree-sitter-python
           p.tree-sitter-json
         ]);
         type = "lua";
         config = getFile ./config/plugins/treesitter.lua;
       }

       vim-nix
	 ];

     extraLuaConfig = getFile ./config/options.lua;
  };
}

# thanks to vimjoyer <3
