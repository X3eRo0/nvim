-- Enable filetype detection, plugin & indent (necessary for VimTeX)
vim.cmd([[
  filetype plugin indent on
  syntax enable
]])

-- Change localleader (used by most VimTeX mappings) from '\' to ','
vim.g.maplocalleader = "\\"

-- Compiler backend: use latexmk with SyncTeX enabled
vim.g.vimtex_compiler_method = "latexmk"
vim.g.vimtex_compiler_latexmk = {
    options = {
        "-pdf",
        "-shell-escape",
        "-synctex=1",
        "-interaction=nonstopmode",
    },
}

-- Tell VimTeX to use your Makefile
-- vim.g.vimtex_compiler_method = "generic"
-- vim.g.vimtex_compiler_generic = {
--     command = "make",
--     -- optional: parse “error” lines into the quickfix list
--     hooks = { "v:lua.vimtex_make_callback" },
-- }
--
-- -- callback to send error messages into VimTeX’s quickfix
-- _G.vimtex_make_callback = function(msg)
--     if msg:match("error") then
--         -- ask VimTeX to re-scan the current TeX file’s log
--         vim.fn["vimtex#compiler#callback"](vim.fn["vimtex#qf#inquire"](vim.b.vimtex.tex))
--     end
-- end

-- Viewer method: Zathura with inverse‐search back into Neovim
vim.g.vimtex_view_method = "zathura"
-- Optional: Enable forward search on Vim command `\lv` (Vimtex view)
vim.g.vimtex_view_general_viewer = "zathura"
vim.g.vimtex_view_general_options =
    [[--synctex-forward @line:@col:@tex --synctex-editor-command 'nvim --server /tmp/nvim-server --remote-send \"\<C-\>\<C-n\>:e @file \| call cursor(@line,@col)\<CR>\" @pdf]]

-- Ensure that your Neovim server is started with a known name
vim.cmd("let $NVIM_LISTEN_ADDRESS='/tmp/nvim-server'")
