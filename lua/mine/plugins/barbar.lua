return {
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
      "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    keys = {
      { "<leader>bQ", "<cmd>BufferCloseAllButCurrent<cr>", desc = "Close all buffers but current" },
      { "<leader>bq", "<cmd>BufferCloseAllButCurrentOrPinned<cr>", desc = "Close all buffers but pinned" },
      { "<leader>bs", "<cmd>BufferPin<cr>", desc = "Pin current buffer" },
      { "<leader>bf", "<cmd>BufferPick<cr>", desc = "Pick a buffer" },
      { "<leader>bn", "<Cmd>BufferNext<CR>", desc = "Next buffer" },
      { "<leader>bp", "<Cmd>BufferPrevious<CR>", desc = "Previous buffer" },
      { "]b", "<Cmd>BufferNext<CR>", desc = "Next buffer" },
      { "[b", "<Cmd>BufferPrevious<CR>", desc = "Previous buffer" },
    },
    config = function()
      local barbar = require("barbar")
      barbar.setup({
        animation = true,
        tabpages = true,
        icons = {
          separator = { left = "", right = "" },
          separator_at_end = false,
          modified = { button = "" },
          pinned = { button = "", filename = true },
          filetype = {
            custom_colors = true,
          },
        },
      })

      -- #486a72
      vim.api.nvim_set_hl(0, "BufferCurrent", { bg = "#3B535A" })
      vim.api.nvim_set_hl(0, "BufferCurrentMod", { bg = "#3B535A" })
      vim.api.nvim_set_hl(0, "BufferDefaultCurrent", { bg = "#3B535A" })
      vim.api.nvim_set_hl(0, "BufferVisible", { bg = "#2B3E44" })
      vim.api.nvim_set_hl(0, "BufferInactive", { bg = "#1F2A3A" })
      vim.api.nvim_set_hl(0, "BufferInactiveMod", { fg = "#dbc074" })
    end,
  },
}
