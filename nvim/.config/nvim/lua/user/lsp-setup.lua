require("nvim-lsp-installer").setup {}
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client)
    require "lsp_signature".on_attach(client)
    require "lsp-format".on_attach(client)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
    vim.keymap.set("n", "J", vim.lsp.buf.signature_help, { buffer = 0 })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
    vim.keymap.set("n", "td", vim.lsp.buf.type_definition, { buffer = 0 })
    vim.keymap.set("n", "ga", vim.lsp.buf.code_action, { buffer = 0 })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = 0 })
    vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { buffer = 0 })
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
    vim.keymap.set("n", "<leader>dll", "<cmd>Telescope diagnostics<CR>", { buffer = 0 })
    vim.keymap.set("n", "<leader>ds", vim.diagnostic.show, { buffer = 0 })
    vim.keymap.set("n", "<leader>do", vim.diagnostic.hide, { buffer = 0 })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = 0 })
    vim.keymap.set("n", "<leader>dl", vim.diagnostic.setqflist, { buffer = 0 })
    vim.keymap.set('n', '<space>i', vim.lsp.buf.formatting, { buffer = 0 })
end


------------ Connected servers --------------------------
-- Python
require 'lspconfig'.pyright.setup {
    on_attach = on_attach
}

-- Golang
require 'lspconfig'.gopls.setup {
    cmd = { 'gopls' },
    on_attach = on_attach
}

-- Lua
require 'lspconfig'.sumneko_lua.setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
        }
    }
}

-- -- HTML
-- require 'lspconfig'.html.setup {
--   on_attach = on_attach
-- }

-- JS
require 'lspconfig'.tsserver.setup {
    on_attach = on_attach,
}

-- Elixir,
require 'lspconfig'.elixirls.setup {
    cmd = { "elixir-ls" },
    on_attach = on_attach,
    capabilities = capabilities,
}
