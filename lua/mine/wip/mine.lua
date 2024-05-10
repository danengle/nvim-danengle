require("tabby").setup()

local filename = require("tabby.filename")
local util = require("tabby.util")

local api = require("tabby.module.api")

local function tab_name(tab)
  return string.gsub(tab, "%[..%]", "")
end

-- local function buffer_name(buf)
--   if string.find(buf, "NvimTree") then
--     return "NvimTree"
--   end
--   return buf
-- end

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
