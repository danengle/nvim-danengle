return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
      {
        "s1n7ax/nvim-window-picker",
        version = "2.*",
        config = function()
          require("window-picker").setup({
            show_prompt = false,
            highlights = {
              statusline = {
                focused = {
                  fg = "#212e3f",
                  bg = "#63cdcf",
                  bold = true,
                },
                unfocused = {
                  fg = "#212e3f",
                  bg = "#63cdcf",
                  bold = true,
                },
              },
            },
            window = {
              position = "left",
              width = 30,
              mapping_options = {
                noremap = true,
                nowait = true,
              },
              mappings = {
                ["V"] = "split_with_window_picker",
                ["v"] = "vsplit_with_window_picker",
              },
            },
            filter_rules = {
              include_current_win = false,
              autoselect_one = true,
              -- filter using buffer options
              bo = {
                -- if the file type is one of following, the window will be ignored
                filetype = { "neo-tree", "neo-tree-popup", "notify" },
                -- if the buffer type is one of following, the window will be ignored
                buftype = { "terminal", "quickfix" },
              },
            },
          })
        end,
      },
    },
    keys = {
      { "<leader>er", "<cmd>Neotree reveal<cr>", { desc = { "Neotree reveal" } } },
      { "<leader>eo", "<cmd>Neotree open<cr>", { desc = { "Neotree open" } } },
      { "<leader>ec", "<cmd>Neotree close<cr>", { desc = { "Neotree close" } } },
    },
    config = function()
      require("neo-tree").setup({
        source_selector = {
          content_layout = "center",
          tabs_layout = "active",
        },
      })
    end,
  },
}
