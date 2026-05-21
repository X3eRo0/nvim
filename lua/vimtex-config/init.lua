-- Enable filetype detection, plugin & indent (necessary for VimTeX)
vim.cmd([[
  filetype plugin indent on
  syntax enable
]])

-- Change localleader (used by most VimTeX mappings) from '\' to ','
vim.g.maplocalleader = "\\"

-- Compiler backend: use latexmk with SyncTeX enabled
vim.g.vimtex_compiler_latexmk = {
    executable = "latexmk",
    options = {
        "-verbose",
        "-file-line-error",
        "-shell-escape",
        "-synctex=1",
        "-pdf",
    },
}

-- Viewer method: Zathura (vimtex's built-in zathura integration
-- handles forward search AND inverse search automatically)
vim.g.vimtex_view_method = "zathura"
