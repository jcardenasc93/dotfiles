-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
  -- NOTE: Yes, you can install new plugins here!
  'mfussenegger/nvim-dap',
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    "nvim-neotest/nvim-nio",
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_setup = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        'delve',
        'codelldb'
      },
    }

    -- Basic debugging keymaps, feel free to change to your liking!
    vim.keymap.set('n', '<leader>dd', dap.continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<leader>dn', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<leader>dot', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<leader>dt', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>db', dap.clear_breakpoints, { desc = 'Debug: Clear Breakpoints' })
    vim.keymap.set('n', '<leader>dr', dap.repl.toggle, { desc = 'Debug: Toggle REPL' })
    vim.keymap.set('n', '<leader>dq', dap.close, { desc = 'Debug: Close debug' })
    vim.keymap.set('n', '<leader>cb', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'Debug: Set Breakpoint' })

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    }

    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<leader>duq', dapui.close, { desc = 'Debug: See last session result.' })

    -- dap.listeners.before.attach['dapui_config'] = dapui.open
    -- dap.listeners.before.launch['dapui_config'] = dapui.open
    -- dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    -- dap.listeners.before.event_exited['dapui_config'] = dapui.close
    -- dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    -- dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    -- dap.listeners.before.event_exited['dapui_config'] = dapui.close

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    -- Install golang specific config
    require('dap-go').setup()

    -- C dap setup
    --
    dap.adapters.codelldb = {
      type = 'server',
      port = "${port}",
      executable = {
        -- CHANGE THIS to your path!
        command = '/home/jcardenasc93/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb',
        args = { "--port", "${port}" },
        stdio = { nil, nil, nil }

        -- On windows you may have to uncomment this:
        -- detached = false,
      }
    }
  end,
}
