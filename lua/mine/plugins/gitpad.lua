return {
  "yujinyuz/gitpad.nvim",
  config = function()
    -- local t = vim.fn.stdpath
    require("gitpad").setup({
      dir = vim.fn.stdpath("data") .. "/gitpad",
      border = "rounded",
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    })
  end,
  keys = {
    {
      "<leader>ge",
      function()
        require("gitpad").toggle_gitpad() -- or require('gitpad').toggle_gitpad({ title = 'Project notes' })
      end,
      desc = "+Gitpad",
    },
    {
      "<leader>gep",
      function()
        require("gitpad").toggle_gitpad() -- or require('gitpad').toggle_gitpad({ title = 'Project notes' })
      end,
      desc = "Gitpad project",
    },
    {
      "<leader>geb",
      function()
        require("gitpad").toggle_gitpad_branch() -- or require('gitpad').toggle_gitpad_branch({ title = 'Branch notes' })
      end,
      desc = "Gitpad branch",
    },
    -- Daily notes
    {
      "<leader>ged",
      function()
        local date_filename = "daily-" .. os.date("%Y-%m-%d.md")
        require("gitpad").toggle_gitpad({ filename = date_filename }) -- or require('gitpad').toggle_gitpad({ filename = date_filename, title = 'Daily notes' })
      end,
      desc = "Gitpad daily notes",
    },
    -- Per file notes
    {
      "<leader>gef",
      function()
        local filename = vim.fn.expand("%:p") -- or just use vim.fn.bufname()
        if filename == "" then
          vim.notify("empty bufname")
          return
        end
        filename = vim.fn.pathshorten(filename, 2) .. ".md"
        require("gitpad").toggle_gitpad({ filename = filename }) -- or require('gitpad').toggle_gitpad({ filename = filename, title = 'Current file notes' })
      end,
      desc = "Gitpad per file notes",
    },
  },
}
