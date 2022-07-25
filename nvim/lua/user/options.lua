local options = {
    number = true,
    numberwidth = 1,
    clipboard = "unnamedplus",
    re = 2,
    showcmd = true,
    fileencoding = "UTF-8",
    showmatch = true,
    hlsearch = true,                         -- highlight all matches on previous search pattern
    ignorecase = true,
    smartcase = true,                        -- smart case
    smartindent = true,                      -- make indenting smarter again
    smarttab = true,
    sw = 2,
    relativenumber = true,
    expandtab = true,                        -- convert tabs to spaces
    shiftwidth = 2,                          -- the number of spaces inserted for each indentation
    tabstop = 2,                             -- insert 2 spaces for a tab
    cursorline = true,                       -- highlight the current line
    redrawtime = 10000,
    autochdir = true,
    laststatus = 2,
    showmode = false,
    scrolloff = 7,
    backspace = "indent,eol,start",
    autoread = true,
    foldmethod = "indent",
    foldnestmax = 10 ,
    foldenable = false,
    foldlevel = 1,
    termguicolors = true,
    updatetime = 0,
    timeoutlen = 200
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
vim.cmd([[let g:gruvbox_contrast_dark = "soft"]])
vim.cmd([[let g:gruvbox_transparent_bg=1]])
vim.cmd([[colorscheme gruvbox]])

-- Floatterm settings
vim.cmd([[let g:floaterm_gitcommit='floaterm']])
vim.cmd([[let g:floaterm_autoinsert=1]])
vim.cmd([[let g:floaterm_width=0.9]])
vim.cmd([[let g:floaterm_height=0.85]])
vim.cmd([[let g:floaterm_wintitle=0]])
vim.cmd([[let g:floaterm_autoclose=1]])

-- Folding
vim.cmd([[set foldmethod=expr]])
vim.cmd([[set foldexpr=nvim_treesitter#foldexpr()]])

vim.cmd([[let g:go_def_mapping_enabled=0]])
