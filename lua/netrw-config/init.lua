-- netrw options

-- *g:netrw_liststyle*        Set the default listing style:
--                               = 0: thin listing (one file per line)
--                               = 1: long listing (one file per line with time
--                                    stamp information and file size)
--                               = 2: wide listing (multiple files in columns)
--                               = 3: tree style listing
vim.g.netrw_fastbrowse = 2
vim.g.netrw_liststyle = 1
vim.g.netrw_keepdir = 0
vim.g.netrw_sizestyle = "H"
vim.g.netrw_mkdir_cmd = "ssh USEPORTT HOSTNAME mkdir -p"
vim.g.localmkdir = "mkdir -p"
-- vim.g.netrw_timefmt = ""
vim.g.netrw_list_cmd = "ssh USEPORT HOSTNAME ls -lashF"
vim.g.netrw_browse_split = 0

-- hi netrwCompress term=NONE cterm=NONE gui=NONE ctermfg=10 guifg=green  ctermbg=0 guibg=black
-- hi netrwData     term=NONE cterm=NONE gui=NONE ctermfg=9 guifg=blue ctermbg=0 guibg=black
-- hi netrwHdr      term=NONE cterm=NONE,italic gui=NONE guifg=SeaGreen1
-- hi netrwLex      term=NONE cterm=NONE,italic gui=NONE guifg=SeaGreen1
-- hi netrwYacc     term=NONE cterm=NONE,italic gui=NONE guifg=SeaGreen1
-- hi netrwLib      term=NONE cterm=NONE gui=NONE ctermfg=14 guifg=yellow
-- hi netrwObj      term=NONE cterm=NONE gui=NONE ctermfg=12 guifg=red
-- hi netrwTilde    term=NONE cterm=NONE gui=NONE ctermfg=12 guifg=red
-- hi netrwTmp      term=NONE cterm=NONE gui=NONE ctermfg=12 guifg=red
-- hi netrwTags     term=NONE cterm=NONE gui=NONE ctermfg=12 guifg=red
-- hi netrwDoc      term=NONE cterm=NONE gui=NONE ctermfg=220 ctermbg=27 guifg=yellow2 guibg=Blue3
-- hi netrwSymLink  term=NONE cterm=NONE gui=NONE ctermfg=220 ctermbg=27 guifg=grey60
