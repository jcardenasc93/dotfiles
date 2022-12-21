local fb_actions = require "telescope".extensions.file_browser.actions

require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ["<CR>"] = function()
                    vim.cmd [[:stopinsert]]
                    vim.cmd [[call feedkeys("\<CR>")]]
                end,
                ["C-h"] = "which_key"
            }
        }
    },
    extensions = {
        file_browser = {
            theme = "nord",
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
        live_grep_args = {
            auto_quoting = false,
            theme = "nord"
        }
    },
    pickers = {
        -- live_grep = {
        --   additional_args = function()
        --     return { "--hidden" }
        --   end
        -- },
        find_files = {
            additional_args = function()
                return { "--hidden" }
            end
        }
    }
}
require('telescope').load_extension('fzf')
require('dapui').setup()
