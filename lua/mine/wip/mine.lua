require("tabby").setup()

local palette = require("nightfox.palette").load("nightfox")
local Color = require("nightfox.lib.color")

local bg = Color.from_hex(palette.bg1)
local red = Color.from_hex("#ff0000")

-- Blend the bg with red. The blend factor is from 0 to 1
-- with 0 being full bg and 1 being full red
local red_bg = bg:blend(red, 0.2)

print(red_bg:to_css())
-- "#471c26"

-- Brighten bg by adding 10 to the value of the color as a hsv
local alt_bg = bg:brighten(10)
print(vim.inspect(alt_bg:to_hsv()))
-- {
--   hue = 213.91304347826,
--   saturation = 47.916666666667,
--   value = 28.823529411765
-- }

-- fg = Color.from_hex(pallete.)

local theme = {
  fill = "TabFill",
  -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
  head = "TabLineHead",
  current_tab = "TabLineSel",
  inactive_tab = "TabLineIn",
  tab = "TabLine",
  win = "TabLineHead",
  tail = "TabLineHead",
}

require("tabby.tabline").set(function(line)
  return {
    {
      { "  ", hl = theme.head },
      line.sep("", theme.head, theme.fill),
    },
    line.tabs().foreach(function(tab)
      local hl = tab.is_current() and theme.current_tab or theme.inactive_tab
      return {
        line.sep("", hl, theme.fill),
        tab.number(),
        "",
        tab_name(tab.name()),
        tab_modified(tab.id),
        line.sep("", hl, theme.fill),
        hl = hl,
        margin = " ",
      }
    end),
    line.spacer(),
    line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
      local hl = win.is_current() and theme.current_tab or theme.inactive_tab
      return {
        line.sep("", hl, theme.fill),
        win.file_icon(),
        "",
        win.buf_name(),
        "",
        "󱡝",
        line.sep("", hl, theme.fill),
        hl = hl,
        margin = " ",
      }
    end),
  }
end)
