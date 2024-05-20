return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cyberdream").setup({
        -- Recommended - see "Configuring" below for more config options
        transparent = true,
        italic_comments = false,
        hide_fillchars = true,
        borderless_telescope = false,
        terminal_colors = true,
        theme = { -- Default: nil
          highlights = {
            -- Highlight groups to override, adding new groups is also possible
            -- See `:help highlight-groups` for a list of highlight groups

            -- Example:
            -- Comment = { fg = "#696969", bg = "NONE", italic = true },

            -- Complete list can be found in `lua/cyberdream/theme.lua`
            CursorLine = { bg = "#1d1d20" },
          },
        },
      })
      vim.cmd("colorscheme cyberdream") -- set the colorscheme
    end,
  },
}
