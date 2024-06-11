return {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  opts = {
    hint_prefix = "󰣉 "
  },
  config = function(_, opts)
    require 'lsp_signature'.setup(opts)

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if vim.tbl_contains({ 'null-ls' }, client.name) then -- blacklist lsp
          return
        end
        require("lsp_signature").on_attach({
          bind = true,
          hint_prefix = "󰣉 "
        }, bufnr)
      end,
      vim.keymap.set({ 'n' }, '<Leader>ks', function()
        vim.lsp.buf.signature_help()
      end, { silent = true, noremap = true, desc = 'toggle signature' })
    })
  end,



}
