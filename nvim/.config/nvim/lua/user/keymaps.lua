M = {}
local opts = { noremap = true, silent = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- --------------- Normal Mode -------------------------------
-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize windows
keymap("n", "<leader>k", ":resize -5<CR>", opts)
keymap("n", "<leader>j", ":resize +5<CR>", opts)
keymap("n", "<leader>hh", ":vertical resize -10<CR>", opts)
keymap("n", "<leader>ll", ":vertical resize +10<CR>", opts)


-- General
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>s", ":w<CR>", opts)
keymap("n", "<leader>n", ":noh<CR>", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "n", "nzz", opts)
keymap("n", "<leader>yp", ":let @+ = expand(\"%\")<CR>", opts)
keymap("n", "<leader>yl", ":let @+ = expand(\"%\") . ':' . line(\".\")<CR>", opts)
keymap("n", "<leader>y", "\"+y", opts)
keymap("v", "<leader>y", "\"+y", opts)
keymap("n", "<leader>p", "\"+p", opts)
keymap("v", "<leader>p", "\"+p", opts)

-- I hate typing these
keymap("n", "<leader>h", "^", opts)
keymap("n", "<leader>l", "$", opts)
keymap("v", "<leader>h", "^", opts)
keymap("v", "<leader>l", "$", opts)
keymap("x", "<leader>h", "^", opts)
keymap("x", "<leader>l", "$", opts)
keymap("o", "<leader>h", "^", opts)
keymap("o", "<leader>l", "$", opts)

-- Quote words
--keymap("n", "<leader>qu", "ciw", opts)

--Nvim Tree
keymap("n", "<leader>b", ":Oil --float %:h<CR>", opts)

-- UndoTree
keymap("n", "<leader>ut", ":UndotreeToggle<CR>", opts)

-- Comment
require('Comment').setup()

-- Telescope
keymap("n", "<leader>ff",
    "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>"
    ,
    {})
-- keymap("n", "<leader>fg", ":Telescope live_grep<CR>", {})
keymap("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", {})
keymap('n', '<leader>fw', '<cmd>lua require(\'telescope.builtin\').grep_string({search = vim.fn.expand("<cword>")})<CR>'
    , {})
keymap('n', '<leader>fb', ':Telescope file_browser<CR>', {})
keymap('n', '<leader>bb', ':Telescope buffers<CR>', {})
keymap('n', '<leader>gb', ':Telescope git_branches<CR>', {})

-- Spectre (Replace text in multiples files)
keymap("n", "<leader>fr", "<cmd>lua require('spectre').open()<CR>", opts)

-- Harpoon
keymap('n', '<leader>al', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', {})
keymap('n', '<leader>aa', ':lua require("harpoon.mark").add_file()<CR>', {})
keymap('n', '<leader>ah', ':lua require("harpoon.ui").nav_file(1)<CR>', {})
keymap('n', '<leader>at', ':lua require("harpoon.ui").nav_file(2)<CR>', {})
keymap('n', '<leader>an', ':lua require("harpoon.ui").nav_file(3)<CR>', {})
keymap('n', '<leader>as', ':lua require("harpoon.ui").nav_file(4)<CR>', {})

-- Lazygit
keymap("n", "<leader>lg", ":FloatermNew lazygit<CR>", opts)

-- Maximizer
keymap("n", "<leader>m", ":MaximizerToggle<CR>", opts)

-- Symbols outline
keymap("n", "<leader>so", ":SymbolsOutline<CR>", opts)

-- Easymotion
keymap("n", "<leader>f", "<Plug>(easymotion-s2)", opts)

-- Toogle last buffers
keymap("n", "<leader>bp", "<Cmd>b#<CR>", {})

-- Python black formatting
-- NOTE: This needs to be updated
keymap("n", "<leader>i", "<Cmd>!black %<CR>", {})

-- Debugging DAP
keymap("n", "<leader>da", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", {})
keymap("n", "dac", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", {})
keymap("n", "<leader>lb", "<Cmd>Telescope dap list_breakpoints<CR>", {})
keymap("n", "<leader>cb", "<Cmd>lua require'dap'.clear_breakpoints()<CR>", {})
keymap("n", "<leader>d", "<Cmd>lua require'dap'.continue()<CR>", {})
keymap("n", "<leader>dq", "<Cmd>lua require'dap'.terminate()<CR>", {})
keymap("n", "<leader>dj", "<Cmd>lua require'dap'.step_over()<CR>", {})
keymap("n", "<leader>din", "<Cmd>lua require'dap'.step_into()<CR>", {})
keymap("n", "<leader>dk", "<Cmd>lua require'dap'.step_out()<CR>", {})
keymap("n", "<leader>rc", "<Cmd>lua require'dap'.run_to_cursor()<CR>", {})
keymap("n", "<leader>dc", "<Cmd>lua require'dap'.repl.open()<CR>", {})
keymap("n", "dD", "<Cmd>lua require('dapui').open()<CR>", {})
keymap("n", "dC", "<Cmd>lua require('dapui').close()<CR>", {})
-- Only for go files
vim.api.nvim_create_autocmd(
    "FileType",
    {
        pattern = "go",
        callback = function()
            vim.api.nvim_set_keymap(
                "n",
                "<leader>dt",
                ":lua require('dap-go').debug_test()<CR>",
                { noremap = true, silent = true }
            )
        end,
    }
)


----------------------- Visual mode -------------
-- Maximizer
keymap("v", "<leader>m", ":MaximizerToggle<CR>gv", opts)

return M
