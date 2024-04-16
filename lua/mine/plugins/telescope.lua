return {
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

    -- local trouble_telescope = require("trouble.sources.telescope")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            -- ["<C-t>"] = trouble_telescope.open(),
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

    -- TODO: find me
    map.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" })
    map.set("n", "<leader>fo", builtin.oldfiles, { desc = "Fuzzy find recent files" })
    map.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep for string in cwd" })
    map.set("n", "<leader>fc", builtin.grep_string, { desc = "Find string under cursor in cwd" })
    map.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help info" })
    map.set("n", "<leader>fb", builtin.buffers, { desc = "Find open buffers" })
    map.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
  end,
}
