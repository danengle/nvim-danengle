return {
  "lukas-reineke/indent-blankline.nvim",
  dependencies = {
    "catppuccin/nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  config = function()
    local colors = require("catppuccin.utils.colors")
    local highlight = {
      "RainbowRed",
      "RainbowYellow",
      "RainbowBlue",
      "RainbowOrange",
      "RainbowGreen",
      "RainbowViolet",
      "RainbowCyan",
    }

    local hooks = require("ibl.hooks")
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      local mocha = require("catppuccin.palettes").get_palette("mocha")
      local text = mocha.surface0
      local red = colors.blend(mocha.red, text, 0.4)
      local yellow = colors.blend(mocha.yellow, text, 0.4)
      local blue = colors.blend(mocha.blue, text, 0.4)
      local orange = colors.blend(mocha.peach, text, 0.4)
      local green = colors.blend(mocha.green, text, 0.4)
      local violet = colors.blend(mocha.lavender, text, 0.4)
      local cyan = colors.blend(mocha.teal, text, 0.4)
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = red })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = yellow })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = blue })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = orange })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = green })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = violet })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = cyan })
    end)

    require("ibl").setup({ indent = { highlight = highlight, char = "┊" } })
  end,
}
