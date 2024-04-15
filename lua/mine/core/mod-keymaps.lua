vim.g.mapleader = " "

local map = vim.keymap

-- globals
map.set("i", "jk", "<ESC>", { desc = "Escape insert mode" })
map.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
map.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
map.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
-- Can't decide if I want just plain escape to clear highlights or use leader based one
-- map.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- splits
map.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
map.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
map.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
map.set("n", "<leader>sq", "<cmd>close<CR>", { desc = "Close current split" })
map.set("n", "<leader>sm", "<cmd>MaximizerToggle<CR>", { desc = "Maximize/minimize a split" })

-- tabs
map.set("n", "<leader>tt", "<cmd>tabnew<CR>", { desc = "Open new tab" })
map.set("n", "<leader>tw", "<cmd>tabclose<CR>", { desc = "Close current tab" })
map.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
map.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
map.set("n", "<leader>tb", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- better up/down - via AstroNvim and others too
map.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move Lines - via AstroNvim
map.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- better indenting - via AstroNvim
map.set("v", "<", "<gv")
map.set("v", ">", ">gv")

-- nvim-tree
-- TODO: move toggle and findFile to single keys
map.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
map.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
map.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
map.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer

-- Find something with telescope
