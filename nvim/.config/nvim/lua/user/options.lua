local options = {
    number = true,
    numberwidth = 1,
    clipboard = "",
    re = 2,
    showcmd = true,
    fileencoding = "UTF-8",
    showmatch = true,
    hlsearch = true, -- highlight all matches on previous search pattern
    ignorecase = true,
    smartcase = true, -- smart case
    smartindent = true, -- make indenting smarter again
    smarttab = true,
    sw = 2,
    relativenumber = true,
    expandtab = true, -- convert tabs to spaces
    shiftwidth = 4, -- the number of spaces inserted for each indentation
    tabstop = 4, -- insert 4 spaces for a tab
    softtabstop = 4,
    cursorline = true, -- highlight the current line
    redrawtime = 10000,
    -- autochdir = true,
    laststatus = 2,
    showmode = false,
    scrolloff = 7,
    backspace = "indent,eol,start",
    autoread = true,
    foldmethod = "indent",
    foldnestmax = 10,
    foldenable = false,
    foldlevel = 1,
    termguicolors = true,
    updatetime = 0,
    timeoutlen = 200,
    mouse = "n",
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- vim.cmd([[let g:gruvbox_contrast_dark = "dark"]])
-- vim.cmd([[let g:gruvbox_transparent_bg=1]])
-- vim.cmd([[colorscheme gruvbox]])
vim.cmd([[colorscheme nord]])
vim.cmd([[highlight Normal ctermbg=NONE guibg=NONE]])

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
