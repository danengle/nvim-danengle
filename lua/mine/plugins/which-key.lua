return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    plugins = {
      spelling = true,
      marks = true,
    },
    preset = {
      z = true,
      g = true,
    },
    icons = {
      separator = "",
      group = "",
    },
    defaults = {
      mode = { "n", "v" },
      ["g"] = { name = "+goto" },
      -- this was a copy paste and doesn't do anything
      -- and there is the surround plugin installed so
      -- maybet that can get annotated here
      -- ["gs"] = { name = "+surround" },
      ["z"] = { name = "+fold" },
      ["]"] = { name = "+next" },
      ["["] = { name = "+prev" },
      ["<leader>b"] = { name = " Buffers" },
      ["<leader>c"] = { name = " Code" },
      ["<leader>e"] = { name = " Explorer" },
      ["<leader>f"] = { name = " File/Find" },
      ["<leader>g"] = { name = "󰘭 Git" },
      ["<leader>i"] = { name = "󰛢 Grapple" },
      ["<leader>j"] = { name = " Flash" },
      ["<leader>n"] = { name = " Neorg" },
      ["<leader>p"] = { name = " Packages" },
      ["<leader>s"] = { name = "󰦅 Search" },
      ["<leader>u"] = { name = "󰨇 Ui/Ux" },
      ["<leader>v"] = { name = "󱃲 Visual Multi" },
      ["<leader>w"] = { name = " Windows" },
      ["<leader>x"] = { name = "󱁤 Diagnostics/Quickfix" },
      ["<leader>t"] = { name = "󱋤 Tabs" },
      ["<leader>k"] = { name = "󱋤 Go tab  or " },
      ["<leader>z"] = { name = "󰩈 Quit" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
