return {
  {
    "renerocksai/telekasten.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "mattn/calendar-vim",
      "nvim-telescope/telescope-media-files.nvim",
      "iamcco/markdown-preview.nvim",
    },
    config = function()
      local tk = require("telekasten")
      tk.setup({
        home = vim.fn.expand("~/zettelkasten"),
      })
    end,
  },
  {
    "nvim-telescope/telescope-media-files.nvim",
    opts = {
      extensions = {
        media_files = {
          -- filetypes whitelist
          -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
          filetypes = { "png", "webp", "jpg", "jpeg" },
          -- find command (defaults to `fd`)
          find_cmd = "rg",
        },
      },
    },
  },
}
