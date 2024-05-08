return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "s1n7ax/nvim-window-picker",
    },
    config = function()
      local nvimtree = require("nvim-tree")
      local window_picker = require("window-picker")

      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      nvimtree.setup({
        view = {
          width = 33,
          relativenumber = true,
        },
        renderer = {
          indent_markers = {
            enable = true,
          },
          icons = {
            glyphs = {
              folder = {
                arrow_closed = "", -- arrow when folder is closed
                arrow_open = "", -- arrow when folder is open
              },
            },
          },
        },
        -- disable window_picker for
        -- explorer to work well with
        -- window splits
        actions = {
          open_file = {
            window_picker = {
              enable = true,
              picker = window_picker.pick_window,
            },
          },
        },
        filters = {
          dotfiles = true,
          custom = { ".DS_Store" },
        },
        -- git = {
        --   ignore = false,
        -- },
      })

      local keymap = vim.keymap

      keymap.set("n", "<leader>we", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
      keymap.set("n", "<leader>v", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle focus file in tree" }) -- toggle file explorer on current file
      keymap.set("n", "<leader>wc", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
      keymap.set("n", "<leader>wr", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
    end,
  },
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    config = function()
      require("window-picker").setup({
        -- floating-big-letter erros out because it seems to have a bug
        -- in identifing winIds correctly. statusline works at least
        show_prompt = false,
        filter_rules = {
          autoselect_one = true,
          include_current_win = false,
        },
        highlights = {
          statusline = {
            -- TODO: colors from nightfox theme...
            -- really need to figure out the way to handle all these
            -- diffrent colors creeping in handled properly
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
      })
    end,
  },
}
