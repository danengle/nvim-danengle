vim.g.mapleader = " "

local map = vim.keymap

map.set("i", "jk", "<ESC>", { desc = "Escape insert mode" })

-- map.set("n", "<ESC><ESC>", "<cmd>nohl<CR>", { desc = "Clear search highlights" })
map.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

--save file
map.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
map.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- splits
map.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
map.set("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" })
map.set("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" })
map.set("n", "<leader>wq", "<cmd>close<CR>", { desc = "Close current split" })

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

-- Resize window using <ctrl> arrow keys
map.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- better indenting
map.set("v", "<", "<gv")
map.set("v", ">", ">gv")

map.set("n", "<leader>ul", "<cmd>")
-- map("n", "<leader>uF", function() LazyVim.format.toggle(true) end, { desc = "Toggle Auto Format (Buffer)" })
-- map("n", "<leader>us", function() LazyVim.toggle("spell") end, { desc = "Toggle Spelling" })
map.set("n", "<leader>uww", "<cmd>set wrap<cr>", { desc = "Word wrap on" })
map.set("n", "<leader>uwo", "<cmd>set nowrap<cr>", { desc = "Word wrap off" })
-- map("n", "<leader>uL", function() LazyVim.toggle("relativenumber") end, { desc = "Toggle Relative Line Numbers" })
-- map("n", "<leader>ul", function() LazyVim.toggle.number() end, { desc = "Toggle Line Numbers" })
