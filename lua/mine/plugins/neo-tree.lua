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
      {
        "<leader>er",
        "<cmd>Neotree reveal position=float<cr>",
        desc = "Open floating Neotree at current location",
      },
      {
        "<leader>el",
        "<cmd>Neotree source=filesystem reveal=true position=left<cr>",
        desc = "Open Neotree on left side",
      },
      { "<leader>ef", "<cmd>Neotree float filesystem<cr>", desc = "Open floating Neotree at CWD" },
      { "<leader>ec", "<cmd>Neotree close<cr>", desc = "Close Neotree" },
    },
    config = function()
      vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
      vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
      vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
      vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })
      vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { fg = "#719cd6" })
      require("neo-tree").setup({
        popup_border_style = "rounded",
        source_selector = {
          content_layout = "center",
          tabs_layout = "active",
        },
        default_component_configs = {
          icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "󱧋",
          },
        },
      })
    end,
  },
}
