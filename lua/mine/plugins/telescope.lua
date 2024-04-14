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
    local transform_mod = require("telescope.actions.mt").transform_mod

    -- local trouble = require("trouble")
    -- local trouble_telescope = require("trouble.providers.telescope")

    -- or create your custom action
    -- local custom_actions = transform_mod({
    --  open_trouble_qflist = function(prompt_bufnr)
    --    trouble.toggle("quickfix")
    --  end,
    -- })

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            -- ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
            -- ["<C-t>"] = trouble_telescope.smart_open_with_trouble,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    local map = vim.keymap
    local builtin = require('telescope.builtin')

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
