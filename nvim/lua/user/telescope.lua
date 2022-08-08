local fb_actions = require "telescope".extensions.file_browser.actions

require('telescope').setup {
  defaults = {},
  extensions = {
    file_browser = {
      theme = "gruvbox",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      -- mappings = {
      --   ["n"] = {
      --     ["c"] = fb_actions.create,
      --
      --     -- unmap toggling `fb_actions.toggle_browser`
      --     -- f = false
      --   },
      -- },
    },
  },
}
require('telescope').load_extension('fzf')
require('dapui').setup()
