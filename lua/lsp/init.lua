require("lsp.mason")
require("lsp.completion")
require("lsp.ui").setup()

-- servers
require("lsp.servers.clangd")
require("lsp.servers.pyright")
require("lsp.servers.lua_ls")
require("lsp.servers.texlab")

-- main config
require("lsp.lsp")
