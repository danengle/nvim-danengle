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
      ["<leader>t"] = { name = " tabs" },
      ["<leader>b"] = { name = " buffers" },
      ["<leader>c"] = { name = " code" },
      ["<leader>f"] = { name = " file/find" },
      ["<leader>h"] = { name = "󰘭 git" },
      ["<leader>i"] = { name = "󰛢 grapple" },
      ["<leader>j"] = { name = " flash" },
      ["<leader>s"] = { name = "󰦅 search" },
      ["<leader>u"] = { name = "󰨇 ui" },
      ["<leader>w"] = { name = " windows" },
      ["<leader>x"] = { name = "󱁤 diagnostics/quickfix" },
      ["<leader>z"] = { name = "󰺿 telekasten" },
      ["<leader>q"] = { name = "󰩈 quit" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
