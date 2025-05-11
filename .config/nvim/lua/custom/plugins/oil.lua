-- File: lua/custom/plugins/oil.lua

return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    vim.keymap.set('n', '<leader>b', ':Oil --float %:h<CR>', { silent = true, noremap = true })
    require('oil').setup {
      columns = {
        'icon',
        -- "permissions",
        'size',
        -- "mtime",
      },
      keymaps = {
        ['<C-h>'] = false,
        ['<C-l>'] = false,
      },
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
      },
    }
  end,
}
