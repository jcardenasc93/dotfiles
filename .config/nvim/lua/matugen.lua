 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#101414',
    base01 = '#1c2020',
    base02 = '#272b2b',
    base03 = '#889392',
    base04 = '#bec9c8',
    base05 = '#e0e3e2',
    base06 = '#e0e3e2',
    base07 = '#e0e3e2',
    base08 = '#ffb4ab',
    base09 = '#d8bbf5',
    base0A = '#afcccc',
    base0B = '#88d3d4',
    base0C = '#d8bbf5',
    base0D = '#88d3d4',
    base0E = '#afcccc',
    base0F = '#93000a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#e0e3e2',          bg = '#101414' })
  hi('TelescopeBorder',         { fg = '#889392',             bg = '#101414' })
  hi('TelescopePromptNormal',   { fg = '#e0e3e2',          bg = '#101414' })
  hi('TelescopePromptBorder',   { fg = '#889392',             bg = '#101414' })
  hi('TelescopePromptPrefix',   { fg = '#88d3d4',             bg = '#101414' })
  hi('TelescopePromptCounter',  { fg = '#bec9c8',  bg = '#101414' })
  hi('TelescopePromptTitle',    { fg = '#101414',             bg = '#88d3d4' })
  hi('TelescopePreviewTitle',   { fg = '#101414',             bg = '#afcccc' })
  hi('TelescopeResultsTitle',   { fg = '#101414',             bg = '#d8bbf5' })
  hi('TelescopeSelection',      { fg = '#e0e3e2',          bg = '#272b2b' })
  hi('TelescopeSelectionCaret', { fg = '#88d3d4',             bg = '#272b2b' })
  hi('TelescopeMatching',       { fg = '#88d3d4',             bold = true })
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
