require('lsp/cmp')
require('lsp/ui_customization').setup()
require('lsp/language_servers')
vim.o.updatetime = 100
vim.cmd [[autocmd CursorHold * lua vim.lsp.buf.hover({focusable=false})]]
vim.cmd [[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})]]
