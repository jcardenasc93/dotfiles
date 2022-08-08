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
-- List of languages
require("dap-go").setup()
