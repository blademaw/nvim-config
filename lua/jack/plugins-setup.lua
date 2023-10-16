-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
  use("nvim-lua/plenary.nvim") -- plugin that others source from
  use("wbthomason/packer.nvim") -- packer

  use("rebelot/kanagawa.nvim")
  use("christoomey/vim-tmux-navigator") -- navigating split windows
  use("szw/vim-maximizer") -- maximize split windows
  use("tpope/vim-surround") -- surround areas with chars
  use("numToStr/Comment.nvim") -- commenting QoL
  use("terryma/vim-expand-region") -- expand region
  -- use("") -- zoom text

  use("nvim-tree/nvim-tree.lua") -- file tree
  use("nvim-tree/nvim-web-devicons") -- icons
  use("nvim-lualine/lualine.nvim") -- status line
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- fuzzy finding
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- like helm/ivy

  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")

  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")
  use("rafamadriz/friendly-snippets")

  use("williamboman/mason.nvim") -- LSP
  use("neovim/nvim-lspconfig") -- servers
  use("williamboman/mason-lspconfig.nvim")
  use("jcorbin/vim-lobster") -- lobster
  use("cheap-glitch/vim-v") -- v syntax highlighting

  -- TeX for vim setup
  use("lervag/vimtex") -- for LaTeX
  use("SirVer/ultisnips") -- for snips
  use("honza/vim-snippets")

  use("hrsh7th/cmp-nvim-lsp") -- configure lsp servers in autocomplete
  use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced UI
  if packer_bootstrap then
    require("packer").sync()
  end

  -- treesitter configuration
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  -- auto closing parentheses / etc.
  use("windwp/nvim-autopairs")
  use("windwp/nvim-ts-autotag")

  use("mbbill/undotree") -- undo tree
  use("tpope/vim-fugitive") -- Git status

  -- use("luk400/vim-jukit") -- ipython in nvim
  use("jpalardy/vim-slime") -- send text to other window
  use({ "dccsillag/magma-nvim", run = ":UpdateRemotePlugins" }) -- integrated development

  -- comments
  use({ "folke/todo-comments.nvim" }) -- for fixme-type highlighting

  -- gruvbox
  -- use({"ellisonleao/gruvbox.nvim"}) -- theme
end)

