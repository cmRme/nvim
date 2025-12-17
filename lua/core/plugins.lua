local lazy = require("lazy")
lazy.setup({
  -- File tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- Git
  "lewis6991/gitsigns.nvim",

  -- Buffers
  "akinsho/bufferline.nvim",

  -- Terminal
  "akinsho/toggleterm.nvim",

  -- LSP
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",

  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
  },
  "glepnir/lspsaga.nvim",

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
    },
  },

  --Snippets
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
  },

  -- "folke/which-key.nvim",
  
  -- UI:
  "nvim-lualine/lualine.nvim",
  "lukas-reineke/indent-blankline.nvim",
  "windwp/nvim-ts-autotag",  -- авто-теги в HTML/JSX
  
  -- Colorscheme:
  "folke/tokyonight.nvim", 
  "ellisonleao/gruvbox.nvim", 
  "catppuccin/nvim",
})
