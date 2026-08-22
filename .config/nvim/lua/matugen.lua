 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#141315',
    base01 = '#201f22',
    base02 = '#2b292c',
    base03 = '#948f98',
    base04 = '#cac4ce',
    base05 = '#e6e1e4',
    base06 = '#e6e1e4',
    base07 = '#e6e1e4',
    base08 = '#ffb4ab',
    base09 = '#e7b9d8',
    base0A = '#cbc3d6',
    base0B = '#cec0ea',
    base0C = '#e7b9d8',
    base0D = '#cec0ea',
    base0E = '#cbc3d6',
    base0F = '#93000a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#e6e1e4',          bg = '#141315' })
  hi('TelescopeBorder',         { fg = '#948f98',             bg = '#141315' })
  hi('TelescopePromptNormal',   { fg = '#e6e1e4',          bg = '#141315' })
  hi('TelescopePromptBorder',   { fg = '#948f98',             bg = '#141315' })
  hi('TelescopePromptPrefix',   { fg = '#cec0ea',             bg = '#141315' })
  hi('TelescopePromptCounter',  { fg = '#cac4ce',  bg = '#141315' })
  hi('TelescopePromptTitle',    { fg = '#141315',             bg = '#cec0ea' })
  hi('TelescopePreviewTitle',   { fg = '#141315',             bg = '#cbc3d6' })
  hi('TelescopeResultsTitle',   { fg = '#141315',             bg = '#e7b9d8' })
  hi('TelescopeSelection',      { fg = '#e6e1e4',          bg = '#2b292c' })
  hi('TelescopeSelectionCaret', { fg = '#cec0ea',             bg = '#2b292c' })
  hi('TelescopeMatching',       { fg = '#cec0ea',             bold = true })
end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
