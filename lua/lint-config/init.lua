local lint = require("lint")
lint.linters_by_ft = {
	python = { "flake8" },
	c = { "cpplint" },
	cpp = { "cpplint" },
	rust = { "snyk" },
	docker = { "snyk" },
}

local lint_augroup = vim.api.nvim_create_augroup("Lint-config", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		lint.try_lint()
	end,
})
