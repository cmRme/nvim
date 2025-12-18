-- require("gitsigns").setup()
require("gitsigns").setup({
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
	},

	current_line_blame = false,

	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local opts = { buffer = bufnr, noremap = true, silent = true }

		-- toggle git signs
		vim.keymap.set(
			"n",
			"<leader>gs",
			gs.toggle_signs,
			vim.tbl_extend("force", opts, { desc = "Git: toggle signs" })
		)

		-- preview hunk
		vim.keymap.set(
			"n",
			"<leader>gp",
			gs.preview_hunk,
			vim.tbl_extend("force", opts, { desc = "Git: preview hunk" })
		)

		-- reset hunk
		vim.keymap.set("n", "<leader>gr", gs.reset_hunk, vim.tbl_extend("force", opts, { desc = "Git: reset hunk" }))

		-- blame current line
		vim.keymap.set("n", "<leader>gb", gs.blame_line, vim.tbl_extend("force", opts, { desc = "Git: blame line" }))
	end,
})
