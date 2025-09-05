-- Lazy Plugin Manager Config
local fn = vim.fn
local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- options
local options = {}

-- plugins
local plugins = {

  -- Ollero.nvim
  {
    "marco-souza/ollero.nvim",
    build = ":!go install github.com/marco-souza/omg@latest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "marco-souza/term.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = true,
  },
  -- Minimal configuration
  {
    "David-Kunz/gen.nvim",
    config = function()
      require("adavidson.plugins.treesitter")
    end,
  },

  -- Svelte
  {
    "evanleck/vim-svelte",
    ft = { "svelte" },
  },
  -- JavaScript plugin
  {
    "pangloss/vim-javascript",
    ft = { "javascript" },
  },
  -- TypeScript plugin (Yats)
  {
    "HerringtonDarkholme/yats.vim",
    ft = { "typescript" },
  },

  -- Config

  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("adavidson.plugins.treesitter")
    end,
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("adavidson.plugins.indent-blankline")
    end,
  },

  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    -- opts = {},
    -- config = function() require('adavidson.plugins.bufferline') end
  },

  {
    "numToStr/Comment.nvim",
    -- opts = {},
    -- config = function() require('adavidson.plugins.comment') end
  },

  -- Git

  -- {
  --   "lewis6991/gitsigns.nvim",
  --   -- opts = {},
  --   -- config = function() require('adavidson.plugins.gitsigns') end
  -- },

  -- Lsp

  {
    "williamboman/mason.nvim",
    -- opts = {},
    -- config = function() require('adavidson.plugins.lsp.mason') end
  },

  {
    "nvimtools/none-ls.nvim",
    config = function()
      require("adavidson.plugins.lsp.null-ls")
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    -- opts = {},
  },

  {
    "neovim/nvim-lspconfig",
    -- opts = {},
  },

  {
    "hrsh7th/nvim-cmp", -- needs setup
    -- opts = {},
    -- config = function() require('adavidson.plugins.cmp') end
  },

  {
    "hrsh7th/cmp-buffer", -- needs setup
    -- opts = {},
    config = function()
      require("adavidson.plugins.cmp")
    end,
  },

  {
    "hrsh7th/cmp-path", -- needs setup
    -- opts = {},
  },

  {
    "saadparwaiz1/cmp_luasnip", -- needs setup
    -- opts = {},
  },

  {
    "hrsh7th/cmp-nvim-lsp", -- needs setup
    -- opts = {},
  },

  {
    "hrsh7th/cmp-nvim-lua", -- needs setup
    -- opts = {},
  },

  {
    "L3MON4D3/LuaSnip", -- needs setup
    dependencies = { "rafamadriz/friendly-snippets" },
    -- opts = {},
  },

  -- Shortcuts

  {
    "folke/which-key.nvim",
    lazy = false,
    priority = 1000,
    -- opts = {},
    config = function()
      require("adavidson.plugins.whichkey")
    end,
  },

  -- Search

  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim", lazy = false },
  },

  -- Themes

  -- {
  --   "navarasu/onedark.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   -- opts = {},
  --   config = function()
  --     require("adavidson.theme.colorscheme")
  --   end,
  -- },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    -- opts = {},
    config = function()
      require("adavidson.theme.colorscheme")
    end,
  },

  -- {
  --   "shaunsingh/nord.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   -- opts = {},
  --   config = function() require('adavidson.theme.colorscheme') end
  -- },

  -- UI / Navigation

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("adavidson.plugins.lualine")
    end,
  },

  {
    "kyazdani42/nvim-tree.lua",
    -- opts = {},
    config = function()
      require("adavidson.plugins.nvim-tree")
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    -- opts = {},
    config = function()
      require("adavidson.plugins.toggleterm")
    end,
  },

  {
    "ahmedkhalf/project.nvim",
    -- opts = {}
  },

  -- {
  --   "lewis6991/impatient.nvim",
  --   -- opts = {}
  -- },

  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("adavidson.plugins.alpha")
    end,
  },
}

require("lazy").setup(plugins, options)
