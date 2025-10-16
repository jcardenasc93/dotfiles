local smart = require 'smart-splits'

return {
  vim.keymap.set('n', '<A-h>', smart.resize_left),
  vim.keymap.set('n', '<A-j>', smart.resize_down),
  vim.keymap.set('n', '<A-k>', smart.resize_up),
  vim.keymap.set('n', '<A-l>', smart.resize_right),
  -- moving between splits
  vim.keymap.set('n', '<C-h>', smart.move_cursor_left),
  vim.keymap.set('n', '<C-j>', smart.move_cursor_down),
  vim.keymap.set('n', '<C-k>', smart.move_cursor_up),
  vim.keymap.set('n', '<C-l>', smart.move_cursor_right),
  vim.keymap.set('n', '<C-\\>', smart.move_cursor_previous),
}
