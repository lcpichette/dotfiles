-- Import keybinds I don't want remapped
local keymap = vim.api.nvim_set_keymap
keymap("n", "<C-k>", "<Cmd>wincmd k<CR>", { noremap = true, silent = true })
keymap("n", "<C-j>", "<Cmd>wincmd j<CR>", { noremap = true, silent = true })
keymap("n", "<C-h>", "<Cmd>wincmd h<CR>", { noremap = true, silent = true })
keymap("n", "<C-l>", "<Cmd>wincmd l<CR>", { noremap = true, silent = true })

-- Plugin-related keybinds
local map = vim.keymap.set

-- ============================================
-- = Telescope file/search-related mappings  =
-- ============================================
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>",  { desc = "Find Grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>",    { desc = "Find Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>",  { desc = "Find Help" })

-- ============================================
-- = Quickfix list-related mappings           =
-- ============================================
-- Open the Quickfix list
map("n", "<leader>qo", ":copen<CR>", { desc = "Open Quickfix List" })
-- Close the Quickfix list
map("n", "<leader>qc", ":cclose<CR>", { desc = "Close Quickfix List" })

-- Optionally map a key to jump to the next Quickfix item
map("n", "<leader>qn", ":cnext<CR>", { desc = "Next Quickfix" })
map("n", "<leader>qp", ":cprev<CR>", { desc = "Prev Quickfix" })

