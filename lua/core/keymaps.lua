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

keymap("n", "<leader>tt", ":ToggleTerm<CR>", opts)
keymap("t", "<Esc>", [[<C-\><C-n>]], opts)

keymap("i", "jk", "<Esc>", { noremap = true })
keymap("n", "<leader>bd", ":bdelete<CR>", opts)
