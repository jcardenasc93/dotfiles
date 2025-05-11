local opts = { noremap = true, silent = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

return {
  -- Resize windows
  keymap('n', '<leader>k', ':resize -5<CR>', opts),
  keymap('n', '<leader>j', ':resize +5<CR>', opts),
  keymap('n', '<leader>hh', ':vertical resize -10<CR>', opts),
  keymap('n', '<leader>ll', ':vertical resize +10<CR>', opts),

  -- General
  keymap('n', '<leader>q', ':q<CR>', opts),
  keymap('n', '<leader>s', ':w<CR>', opts),
  keymap('n', '<leader>n', ':noh<CR>', opts),
  keymap('n', '<C-u>', '<C-u>zz', opts),
  keymap('n', '<C-d>', '<C-d>zz', opts),
  keymap('n', 'n', 'nzz', opts),
  keymap('n', '<leader>yp', ':let @+ = expand("%")<CR>', opts),
  keymap('n', '<leader>yl', ':let @+ = expand("%") . \':\' . line(".")<CR>', opts),
  keymap('n', '<leader>y', '"+y', opts),
  keymap('v', '<leader>y', '"+y', opts),
  keymap('n', '<leader>p', '"+p', opts),
  keymap('v', '<leader>p', '"+p', opts),

  -- Vertical motion
  keymap('n', 'j', 'jzz', opts),
  keymap('n', 'k', 'kzz', opts),

  -- I hate typing these
  keymap('n', '<leader>h', '^', opts),
  keymap('n', '<leader>l', '$', opts),
  keymap('v', '<leader>h', '^', opts),
  keymap('v', '<leader>l', '$', opts),
  keymap('x', '<leader>h', '^', opts),
  keymap('x', '<leader>l', '$', opts),
  keymap('o', '<leader>h', '^', opts),
  keymap('o', '<leader>l', '$', opts),

  -- Toogle last buffers
  keymap('n', '<leader>bp', '<Cmd>b#<CR>', {}),

  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' }),
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' }),
  -- vim.cmd.colorscheme 'everforest',
}
