return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    local opts = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000
    }

    conform.setup({
      formatters_by_ft = {
        python = { "isort", "black" }
      },
      format_on_save = opts
    })

    vim.keymap.set({ "n", "v" }, "<leader>pp", function()
      conform.format(opts)
    end)
  end
}
