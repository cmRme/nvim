local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<leader>t", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>tf", ":NvimTreeFocus<CR>", opts)

keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)

keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<C-l>", ":BufferLineCloseOthers<CR>", opts)

keymap("n", "<leader>gs", ":Gitsigns toggle_signs<CR>", opts)
keymap("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", opts)
keymap("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", opts)
keymap("n", "<leader>gb", ":Gitsigns blame_line<CR>", opts)

keymap("n", "<leader>tt", ":ToggleTerm<CR>", opts)
keymap("t", "<Esc>", [[<C-\><C-n>]], opts)

keymap("i", "jk", "<Esc>", { noremap = true })
keymap("n", "<leader>bd", ":bdelete<CR>", opts)

-- следующая диагностика
keymap("n", "]d", vim.diagnostic.goto_next, {
	desc = "Next diagnostic",
})

-- предыдущая диагностика
keymap("n", "[d", vim.diagnostic.goto_prev, {
	desc = "Prev diagnostic",
})

-- показать сообщение об ошибке под курсором
keymap("n", "<leader>e", vim.diagnostic.open_float, {
	desc = "Show diagnostic message",
})

-- code actions (ESLint: fix / disable rule / quick fix)
keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {
	desc = "Code actions (lint fixes)",
})
