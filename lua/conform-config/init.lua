require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		html = { "prettier" },
		css = { "prettier" },
		javascript = { "prettier" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		rust = { "rustfmt" },
		sh = { "beautysh" },
	},
	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	},
	notify_on_error = false,
})

local group = vim.api.nvim_create_augroup("Conform.nvim", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*",
	group = group,
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
