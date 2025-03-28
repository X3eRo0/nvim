local common = require("lsp.common")


vim.lsp.config.clangd = {
    on_attach = common.on_attach,
    capabilities = common.capabilities,
    handlers = common.handlers,
	cmd = {
		"clangd",
		"--completion-style=detailed",
		"--background-index=false",
		"--experimental-modules-support",
		"--clang-tidy",
		"--query-driver=/usr/bin/g++", -- Use GCC 14's standard library
		"--header-insertion=never",
	},
	filetypes = { "c", "cc", "cpp", "h", "hpp", "ixx", "cppm", "inl" },
	root_markers = { ".clang-format", ".git", "compile_commands.json", "CMakeLists.txt" },
}

vim.lsp.enable({ "clangd" })
