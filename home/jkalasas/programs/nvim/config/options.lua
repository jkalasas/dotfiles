vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.clipboard = 'unnamedplus'

vim.o.number = true
-- vim.o.relativenumber = true

vim.o.signcolumn = 'yes'

vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.o.updatetime = 300

vim.o.termguicolors = true

vim.o.mouse = 'a'

vim.cmd.colorscheme "catppuccin"

local M = {
	n = {
		-- comment
		['<leader>/'] = function()
			require("Comment.api").toggle.linewise.current()
		end,

		-- save
		['<C-s>'] = '<cmd> w <CR>',

		-- window navigation
		['<C-h>'] = '<C-w>h',
		['<C-l>'] = '<C-w>l',
		['<C-j>'] = '<C-w>j',
		['<C-k>'] = '<C-w>k',

		-- buffers
		['<leader>t'] = '<cmd> enew <CR>',
		['<leader>w'] = '<cmd> bd <CR>',
		['<leader>x'] = '<cmd> bd <CR>',
		['<tab>'] = '<cmd> bnext <CR>',
		['<S-tab>'] = '<cmd> bprevious <CR>',

		-- formatter
		['<leader>fm'] = function()
			vim.lsp.buf.format { async = true };
        end,

		-- nvim-tree
		['<C-n>'] = '<cmd> NvimTreeToggle <CR>',
		['<leader>e'] = '<cmd> NvimTreeFocus <CR>',

		-- telescope
		['<leader>ff'] = '<cmd> Telescope find_files <CR>',
		['<leader>fa'] = '<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>',
		['<leader>fw'] = '<cmd> Telescope live_grep <CR>',
		['<leader>fb'] = '<cmd> Telescope buffers <CR>',
	},

	v = {
		['<leader>/'] = "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
	},
}

for mode, entry in pairs(M) do
	for keys, action in pairs(entry) do
		vim.keymap.set(mode, keys, action)
	end
end
