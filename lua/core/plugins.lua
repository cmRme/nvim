local lazy = require("lazy")
lazy.setup({
	-- File tree
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("plugins.nvim-tree")
		end,
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- Git
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugins.gitsigns")
		end,
	},

	-- Buffers
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins.bufferline")
		end,
	},

	-- Terminal
	{
		"akinsho/toggleterm.nvim",
		cmd = { "ToggleTerm", "TermExec" },
		config = function()
			require = "plugins.toggleterm"
		end,
	},

	-- LSP
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" }, -- грузится перед сохранением
	},

	-- Completion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
	},

	--Snippets
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
	},

	-- laspsaga
	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
		config = function()
			require("plugins.lspsaga")
		end,
	},

	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			require("plugins.lualine")
		end,
	},

	-- UI:
	{ "lukas-reineke/indent-blankline.nvim", event = "VeryLazy" },
	{ "windwp/nvim-ts-autotag", event = "InsertEnter" }, -- авто-теги в HTML/JSX
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = { enable = true },
				indent = { enable = true },
				ensure_installed = { "lua", "python", "javascript", "typescript", "html", "css", "go", "rust" },
			})
		end,
	},

	-- Автоустановка форматтеров Masson
	"WhoIsSethDaniel/mason-tool-installer.nvim",

	-- Colorscheme:
	"folke/tokyonight.nvim",
	"ellisonleao/gruvbox.nvim",
	"catppuccin/nvim",
})
