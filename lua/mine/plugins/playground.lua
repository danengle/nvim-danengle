-- This is just a placeholder for my own personal neovim plugin stuff
-- which is for learning but also for setting custom colors on plugins at this point
return {
  dir = "$XDG_CONFIG_HOME/nvim/lua/mine/playground",
  lazy = false,
  dependencies = {
    "EdenEast/nightfox.nvim",
  },
  config = function()
    local playground = require("playground")
    playground.setup({})
  end,
}

-- It mostly consists of a mess of things like this...
-- local palette = require("nightfox.palette").load("nightfox")
-- local Color = require("nightfox.lib.color")

-- local light0 = Color.from_hex(palette.fg0)
-- local red = Color.from_hex(palette.red.base)
-- local bd3 = dark1:blend(blue, 0.5)

-- local rd4 = dark1:blend(red, 0.9)
-- local magentadim = Color.from_hex(palette.magenta.dim)

-- local cursor = { fg = text_lt, bg = rd4:to_css() }
-- local match = { fg = text_lt, bg = magentadim:to_css() }

-- vim.api.nvim_set_hl(0, "PlaygroundSearchCursor", cursor)
-- vim.api.nvim_set_hl(0, "PlaygroundSearchMatch", match)
-- vim.api.nvim_set_hl(0, "PlaygroundBlueBaseSel", { fg = light0:to_css(), bg = bd3:to_css() })

-- vim.api.nvim_set_hl(0, "FlashLabel", { link = "PlaygroundSearchCursor" })
-- vim.api.nvim_set_hl(0, "FlashMatch", { link = "PlaygroundSearchMatch" })
