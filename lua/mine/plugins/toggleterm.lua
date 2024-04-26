return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    local term = require("toggleterm")
    term.setup({
      open_mapping = [[<A-\>]],
    })
    -- These don't seem to work as expected yet...open_mapping keymap works though
    local topts = { buffer = 0 }
    vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], topts)
    vim.keymap.set("t", "jk", [[<C-\><C-n>]], topts)
    vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], topts)
    vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], topts)
    vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], topts)
    vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], topts)
    vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], topts)
  end,
  -- keys = {
  --
  -- }
}
