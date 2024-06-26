return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons",
      "folke/todo-comments.nvim",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous, -- move to prev result
              ["<C-j>"] = actions.move_selection_next, -- move to next result
            },
          },
          path_display = { "truncate" },
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = { prompt_position = "top", preview_width = 0.55 },
            vertical = { mirror = false },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
        },
      })

      telescope.load_extension("fzf")

      local map = vim.keymap
      local builtin = require("telescope.builtin")

      map.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" })
      map.set("n", "<leader>fo", builtin.oldfiles, { desc = "Fuzzy find recent files" })
      map.set("n", "<leader>fw", builtin.live_grep, { desc = "Grep for string in cwd" })
      map.set("n", "<leader>fW", builtin.grep_string, { desc = "Find string under cursor in cwd" })
      map.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help info" })
      map.set("n", "<leader>fH", builtin.command_history, { desc = "Find from command history" })
      map.set("n", "<leader>fb", builtin.buffers, { desc = "Find open buffers" })
      map.set("n", "<leader>fg", builtin.registers, { desc = "Find current registers" })
      map.set("n", "<leader>fz", builtin.current_buffer_fuzzy_find, { desc = "Find current buffer fuzzy" })
      map.set("n", "<leader>fc", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
      map.set("n", "<leader>ut", builtin.colorscheme, { desc = "Browse colorschemes" })
      map.set("n", "<leader>fl", builtin.highlights, { desc = "Browse highlight values" })
      map.set("n", "<leader>fk", builtin.keymaps, { desc = "Browse normal mode keymaps" })
    end,
  },
  {
    "LukasPietzschmann/telescope-tabs",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      { "<leader>ft", "<cmd>Telescope telescope-tabs list_tabs<cr>", desc = "Find a tab" },
    },
    config = function()
      require("telescope").load_extension("telescope-tabs")
      require("telescope-tabs").setup({
        -- Your custom config :^)
      })
    end,
    {
      "doctorfree/cheatsheet.nvim",
      event = "VeryLazy",
      dependencies = {
        { "nvim-telescope/telescope.nvim" },
        { "nvim-lua/popup.nvim" },
        { "nvim-lua/plenary.nvim" },
      },
      config = function()
        local ctactions = require("cheatsheet.telescope.actions")
        require("cheatsheet").setup({
          bundled_cheetsheets = {
            enabled = { "default", "lua", "markdown", "regex", "netrw", "unicode" },
            disabled = { "nerd-fonts" },
          },
          bundled_plugin_cheatsheets = {
            enabled = {
              "auto-session",
              "goto-preview",
              "octo.nvim",
              "telescope.nvim",
              "vim-easy-align",
              "vim-sandwich",
            },
            disabled = { "gitsigns" },
          },
          include_only_installed_plugins = true,
          telescope_mappings = {
            ["<CR>"] = ctactions.select_or_fill_commandline,
            ["<A-CR>"] = ctactions.select_or_execute,
            ["<C-Y>"] = ctactions.copy_cheat_value,
            ["<C-E>"] = ctactions.edit_user_cheatsheet,
          },
        })
      end,
    },
  },
  {
    "danielfalk/smart-open.nvim",
    branch = "0.2.x",
    dependencies = {
      "kkharji/sqlite.lua",
      -- Only required if using match_algorithm fzf
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      -- Optional.  If installed, native fzy will be used when match_algorithm is fzy
      { "nvim-telescope/telescope-fzy-native.nvim" },
    },
    config = function()
      require("telescope").load_extension("smart_open")
      vim.keymap.set("n", "<leader>fs", function()
        require("telescope").extensions.smart_open.smart_open()
      end, { noremap = true, silent = true })
    end,
  },
}
