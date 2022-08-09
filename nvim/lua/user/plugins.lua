local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end
-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)

  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "easymotion/vim-easymotion"
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    --tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use "ryanoasis/vim-devicons" -- file icons
  use "christoomey/vim-tmux-navigator"
  --use "sheerun/vim-polyglot"
  -- Color scheme
  use "morhetz/gruvbox"
  use "NvChad/nvim-colorizer.lua"

  --Python
  use "vim-python/python-syntax"

  --use "itchyny/lightline.vim"
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use "itchyny/vim-gitbranch"
  --use "preservim/nerdcommenter"
  use "numToStr/Comment.nvim"
  use "mg979/vim-visual-multi"
  use "tpope/vim-surround"
  use "windwp/nvim-spectre" -- Replacing in multiple files
  use 'lewis6991/impatient.nvim'
  use "karb94/neoscroll.nvim"
  use "folke/todo-comments.nvim"
  use "RRethy/vim-illuminate"
  -- Float term
  use "voldikss/vim-floaterm"

  -- Git
  use "tpope/vim-fugitive" -- Git integration
  use "tpope/vim-rhubarb" -- Git integration

  use "christoomey/vim-tmux-runner"
  use "tmux-plugins/vim-tmux-focus-events"
  use "szw/vim-maximizer"
  use "notjedi/nvim-rooter.lua"
  --" Hex Highlighting
  --use "rrethy/vim-hexokinase", { "do": "make hexokinase" }

  --use "valloric/MatchTagAlways"
  use "Yggdroot/indentLine"
  use "djoshea/vim-autoread"
  use "simrat39/symbols-outline.nvim" -- Tags navigation

  -- CSV Files
  use "mechatroner/rainbow_csv"

  -- Flutter
  -- use "dart-lang/dart-vim-plugin"
  -- use "thosakwe/vim-flutter"

  --use "iamcco/markdown-preview.nvim", { "do": "cd app && yarn install"  }  --md Preview
  use "ThePrimeagen/harpoon"
  use "tpope/vim-eunuch"

  -- Go
  -- use "fatih/vim-go"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "tom-anders/telescope-vim-bookmarks.nvim"
  use "lalitmee/browse.nvim"
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { "nvim-telescope/telescope-file-browser.nvim" }

  -- cmp plugins
  use { "hrsh7th/nvim-cmp" }
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "L3MON4D3/LuaSnip" -- Snippets

  -- LSP
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use "williamboman/nvim-lsp-installer"
  use {
    "ray-x/lsp_signature.nvim",
  }
  use "lukas-reineke/lsp-format.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  }
  use "p00f/nvim-ts-rainbow"
  use 'nvim-treesitter/nvim-treesitter-context'


  -- Debugger
  use "mfussenegger/nvim-dap"
  use "mfussenegger/nvim-dap-python"
  use "leoluz/nvim-dap-go"
  use "rcarriga/nvim-dap-ui"
  use "theHamsta/nvim-dap-virtual-text"
  use "nvim-telescope/telescope-dap.nvim"
  use "HiPhish/debugpy.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
