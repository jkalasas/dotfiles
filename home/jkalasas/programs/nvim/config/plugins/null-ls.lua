local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		-- formatters
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.taplo,

		-- linters
		null_ls.builtins.code_actions.eslint_d,
	},
})
