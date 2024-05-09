return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    keys = {
      { "<leader>er", "<cmd>Neotree reveal<cr>", { desc = { "Neotree reveal" } } },
      { "<leader>ef", "<cmd>Neotree float filesystem<cr>", { desc = { "Neotree floating" } } },
      { "<leader>eo", "<cmd>Neotree open<cr>", { desc = { "Neotree open" } } },
      { "<leader>ec", "<cmd>Neotree close<cr>", { desc = { "Neotree close" } } },
    },
    config = function()
      require("neo-tree").setup({

        vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { fg = "#719cd6" }),
        popup_border_style = "rounded",
        source_selector = {
          content_layout = "center",
          tabs_layout = "active",
        },
      })
    end,
  },
}
