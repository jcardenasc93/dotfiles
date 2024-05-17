local options = {
    number = true,
    numberwidth = 1,
    clipboard = "",
    re = 2,
    showcmd = true,
    fileencoding = "UTF-8",
    showmatch = true,
    ignorecase = true,
    smartcase = true,   -- smart case
    smartindent = true, -- make indenting smarter again
    smarttab = true,
    sw = 2,
    relativenumber = true,
    expandtab = true,  -- convert tabs to spaces
    shiftwidth = 4,    -- the number of spaces inserted for each indentation
    tabstop = 4,       -- insert 4 spaces for a tab
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
    -- foldlevel = 1,
    termguicolors = true,
    updatetime = 0,
    timeoutlen = 200,
    mouse = "n",
    background = "dark",
    guicursor = ""
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- Folding
vim.cmd([[set foldmethod=expr]])
vim.cmd([[set foldexpr=nvim_treesitter#foldexpr()]])

vim.cmd([[let g:go_def_mapping_enabled=0]])

-- Background & colorscheme
vim.cmd([[highlight Normal ctermbg=NONE guibg=NONE]])
vim.cmd([[colorscheme catppuccin-mocha]])

-- AutoCMDs
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
    command = "if mode() != 'c' | checktime | endif",
    pattern = { "*" },
})


-- Keymaps
local opts = { noremap = true, silent = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap


-- Window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize windows
keymap("n", "<leader>k", ":resize -5<CR>", opts)
keymap("n", "<leader>j", ":resize +5<CR>", opts)
keymap("n", "<leader>hh", ":vertical resize -10<CR>", opts)
keymap("n", "<leader>ll", ":vertical resize +10<CR>", opts)

-- General
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>s", ":w<CR>", opts)
keymap("n", "<leader>n", ":noh<CR>", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "n", "nzz", opts)
keymap("n", "<leader>yp", ":let @+ = expand(\"%\")<CR>", opts)
keymap("n", "<leader>yl", ":let @+ = expand(\"%\") . ':' . line(\".\")<CR>", opts)
keymap("n", "<leader>y", "\"+y", opts)
keymap("v", "<leader>y", "\"+y", opts)
keymap("n", "<leader>p", "\"+p", opts)
keymap("v", "<leader>p", "\"+p", opts)

-- Vertical motion
keymap("n", "j", "jzz", opts)
keymap("n", "k", "kzz", opts)

-- I hate typing these
keymap("n", "<leader>h", "^", opts)
keymap("n", "<leader>l", "$", opts)
keymap("v", "<leader>h", "^", opts)
keymap("v", "<leader>l", "$", opts)
keymap("x", "<leader>h", "^", opts)
keymap("x", "<leader>l", "$", opts)
keymap("o", "<leader>h", "^", opts)
keymap("o", "<leader>l", "$", opts)

-- Toogle last buffers
keymap("n", "<leader>bp", "<Cmd>b#<CR>", {})

-- Oil file tree
keymap("n", "<leader>b", ":Oil --float %:h<CR>", opts)

-- Maximize window
keymap("n", "<leader>m", "<cmd>lua require('maximize').toggle()<CR>", opts)

-- Harpoon
local harpoon = require("harpoon")
harpoon:setup()
vim.keymap.set("n", "<leader>aa", function() harpoon:list():append() end)
vim.keymap.set("n", "<leader>al", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<leader>ah", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>at", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>an", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>as", function() harpoon:list():select(4) end)

-- Undotree
keymap("n", "<leader>ut", ":UndotreeToggle<CR>", opts)
