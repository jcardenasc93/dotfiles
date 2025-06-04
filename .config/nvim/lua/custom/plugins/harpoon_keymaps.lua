local harpoon = require 'harpoon'

-- REQUIRED
harpoon:setup()
-- REQUIRED

return {
  vim.keymap.set('n', '<leader>aa', function()
    harpoon:list():add()
  end),
  vim.keymap.set('n', '<leader>al', function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
  end),

  vim.keymap.set('n', '<leader>ah', function()
    harpoon:list():select(1)
  end),
  vim.keymap.set('n', '<leader>at', function()
    harpoon:list():select(2)
  end),
  vim.keymap.set('n', '<leader>an', function()
    harpoon:list():select(3)
  end),
  vim.keymap.set('n', '<leader>as', function()
    harpoon:list():select(4)
  end),
}
