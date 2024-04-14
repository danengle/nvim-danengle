vim.g.mapleader = " "

local map = vim.keymap

map.set("i", "jk", "<ESC>", { desc = "Escape insert mode" })

map.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- splits
map.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
map.set("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" })
map.set("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" })
map.set("n", "<leader>wq", "<cmd>close<CR>", { desc = "Close current split" })

map.set("n", "<leader>tt", "<cmd>tabnew<CR>", { desc = "Open new tab" })
map.set("n", "<leader>tw", "<cmd>tabclose<CR>", { desc = "Close current tab" })
map.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
map.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
map.set("n", "<leader>tb", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

map.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
map.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
--save file
map.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- better up/down
map.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move Lines
map.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- better indenting
map.set("v", "<", "<gv")
map.set("v", ">", ">gv")
