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
      -- you can enable a preset for easier configuration
      presets = {
        -- bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
        border = {
          style = "rounded",
          padding = { 4, 6 },
        },
      },
      vim.keymap.set("n", "<leader>fn", "<cmd>NoiceTelescope<CR>", { desc = "Find Noice messages" }),
    })
  end,
}
