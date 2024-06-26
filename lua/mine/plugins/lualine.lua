return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count
    -- local cyberdream = require("lualine.themes.cyberdream")
    lualine.setup({
      options = {
        theme = "nightfox",
        -- theme = require("neofusion.lualine"),
        -- theme = "cyberdream",
        -- theme = "tokyonight",
        -- theme = "catppuccin",
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "filetype" },
        },
      },
    })
  end,
}
