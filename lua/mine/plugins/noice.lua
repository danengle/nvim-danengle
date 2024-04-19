return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
  },
  keys = {},
  config = function()
    require("telescope").load_extension("noice")
    require("noice").setup({
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
        -- cmdline_popup = {
        --   backend = "popup",
        --   relative = "editor",
        --   focusable = false,
        --   enter = false,
        --   zindex = 200,
        --   position = {
        --     row = "50%",
        --     col = "59%",
        --   },
        --   size = {
        --     min_width = 60,
        --     width = "auto",
        --     height = "auto",
        --   },
        --   border = {
        --     style = "rounded",
        --     padding = { 4, 6 },
        --   },
        -- },
        -- hover = {
        --   view = "popup",
        --   relative = "cursor",
        --   zindex = 45,
        --   enter = false,
        --   anchor = "auto",
        --   size = {
        --     width = "auto",
        --     height = "auto",
        --     max_height = 20,
        --     max_width = 120,
        --   },
        --   border = {
        --     style = "rounded",
        --     padding = { 4, 4 },
        --   },
        --   position = { row = 1, col = 0 },
        --   win_options = {
        --     wrap = true,
        --     linebreak = true,
        --   },
        -- },
      },
      presets = {
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
        border = {
          style = "rounded",
          padding = { 4, 6 },
        },
      },
      -- There was some kind of popup/popover that didn't look how I wanted and
      -- by the time I got back around to attempting to mess with it here, I couldn't
      -- remember exactly which one it was or how to activate it. I don't fully
      -- understand all the implications with these changes below because some changes
      -- affected messages in unexpecte ways while other changes appeared to do nothing.
      -- Leaving these here for now to remind me to come back to them later.
      views = {
        cmdline_popup = {
          position = {
            row = 5,
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
        },
        popupmenu = {
          relative = "editor",
          position = {
            row = 8,
            col = "50%",
          },
          size = {
            width = 60,
            height = 10,
          },
          border = {
            style = "rounded",
            padding = { 2, 2 },
          },
          win_options = {
            winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
          },
        },
      },
      vim.keymap.set("n", "<leader>fn", "<cmd>NoiceTelescope<CR>", { desc = "Find Noice messages" }),
    })
  end,
}
