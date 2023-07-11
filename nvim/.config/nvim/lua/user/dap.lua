require("nvim-dap-virtual-text").setup()
require("dapui").setup()
-- Auto open/close dapui
local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.exited["dapui_config"] = function()
  dapui.close()
end

local function get_arguments()
  local co = coroutine.running()
  if co then
    return coroutine.create(function()
      local args = {}
      vim.ui.input({ prompt = "Args: " }, function(input)
        args = vim.split(input or "", " ")
      end)
      coroutine.resume(co, args)
    end)
  else
    local args = {}
    vim.ui.input({ prompt = "Args: " }, function(input)
      args = vim.split(input or "", " ")
    end)
    return args
  end
end
-- List of languages
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "go",
--   callback = function()
--     require("dap-go").setup()
--   end
-- })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    require("dap-python").setup("~/.asdf/shims/python")
  end
})

-- Adapters setup --
-- GO adapters setup
dap.adapters.go = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'dlv',
    args = { 'dap', '-l', '127.0.0.1:${port}' },
  }
}
dap.configurations.go = {
  {
    type = "go",
    name = "Server",
    request = "launch",
    showLog = true,
    mode = "debug",
    program = "./${relativeFileDirname}",
    dlvToolPath = vim.fn.exepath('dlv') -- Adjust to where delve is installed
  },
  {
    type = "go",
    name = "Debug",
    request = "launch",
    showLog = false,
    program = "${file}",
    dlvToolPath = vim.fn.exepath('dlv') -- Adjust to where delve is installed
  },
  {
    type = "go",
    name = "Debug (Arguments)",
    request = "launch",
    program = "${file}",
    args = get_arguments,
  },
  {
    type = "go",
    name = "Debug test", -- configuration for debugging test files
    request = "launch",
    mode = "test",
    showLog = false,
    program = "${file}"
  },
  -- works with go.mod packages and sub packages
  {
    type = "go",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}"
  }
}
