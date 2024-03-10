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
        # language servers
        asm-lsp
        emmet-ls
        typescript
        nodePackages.intelephense
        nodePackages.pyright
        nodePackages.svelte-language-server
        nodePackages.typescript-language-server
        lua-language-server
        luajitPackages.lua-lsp
        rustup
        tailwindcss-language-server
        taplo # toml
        vscode-langservers-extracted

        # formatters
        black
        prettierd
        stylua

        # linters
        eslint_d

        # telescope media support
        chafa
        imagemagick
        ffmpegthumbnailer

        rnix-lsp

        fd
        ripgrep
        xclip
        wl-clipboard
      ];

      plugins = with pkgs.vimPlugins; [
        {
          plugin = bufferline-nvim;
          type = "lua";
          config = "require(\"bufferline\").setup{}";
        }
        {
          plugin = catppuccin-nvim;
          type = "lua";
          config = getFile ./config/plugins/catppuccin.lua;
        }
        {
          plugin = comment-nvim;
          type = "lua";
          config = "require(\"Comment\").setup{}";
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

        {
          plugin = lualine-nvim;
          type = "lua";
          config = "require('lualine').setup()";
        }

        neodev-nvim

        {
          plugin = null-ls-nvim;
          type = "lua";
          config = getFile ./config/plugins/null-ls.lua;
        }

        {
          plugin = nvim-tree-lua;
          type = "lua";
          config = getFile ./config/plugins/nvim-tree.lua;
        }

        markdown-preview-nvim

        {
          plugin = telescope-nvim;
          type = "lua";
          config = getFile ./config/plugins/telescope.lua;
        }

        telescope-fzf-native-nvim
        telescope-media-files-nvim

        {
          plugin = (nvim-treesitter.withPlugins (p: [
            p.tree-sitter-nix
            p.tree-sitter-vim
            p.tree-sitter-bash
            p.tree-sitter-lua
            p.tree-sitter-markdown
            p.tree-sitter-markdown-inline
            p.tree-sitter-python
            p.tree-sitter-javascript
            p.tree-sitter-typescript
            p.tree-sitter-json
            p.tree-sitter-svelte
            p.tree-sitter-rust
          ]));
          type = "lua";
          config = getFile ./config/plugins/treesitter.lua;
        }

        vim-nix
        vim-tmux-navigator
      ];

      extraLuaConfig = getFile ./config/options.lua;
    };
}

# thanks to vimjoyer <3
