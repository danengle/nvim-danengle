return {
  {
    "nanozuki/tabby.nvim",
    event = "VimEnter",
    dependencies = "nvim-tree/nvim-web-devicons",
    keys = {
      {
        "<leader>tr",
        function()
          local tabby = require("tabby")
          local tab_name = vim.fn.input("Rename this tab: ")
          if not tab_name or tab_name == "" then
            local notify = require("notify")
            notify("Unable to rename tab with blank input", vim.log.levels.WARN, { title = "Tabby:" })
          else
            tabby.tab_rename(tab_name)
          end
        end,
        desc = "Rename current tab",
      },
      { "<leader>tf", "<cmd>Tabby pick_window<cr>", desc = "Pick a window" },
    },
    config = function()
      local tab_name = require("tabby.feature.tab_name")
      local default_options = {
        name_fallback = function(_) -- tabid
          return ""
        end,
      }
      tab_name.set_default_option(default_options)
      local palette = require("nightfox.palette").load("nightfox")
      local Color = require("nightfox.lib.color")

      local dark = Color.from_hex(palette.bg1)
      local light = Color.from_hex(palette.fg1)
      local light0 = Color.from_hex(palette.fg0)
      local fill = Color.from_hex(palette.bg0)
      local green = Color.from_hex(palette.green.base)
      local blue = Color.from_hex(palette.blue.base)

      local bd1 = dark:blend(blue, 0.1)
      local bd2 = dark:blend(blue, 0.2)
      local bd3 = dark:blend(blue, 0.9)
      local bl1 = light:blend(blue, 0.1)

      local gd1 = dark:blend(green, 0.1)
      local gd2 = dark:blend(green, 0.3)
      local gd3 = dark:blend(green, 0.9)
      local gl1 = light:blend(green, 0.1)

      local tab1 = { fg = bl1:to_css(), bg = bd1:to_css() }
      local tab2 = { fg = bl1:to_css(), bg = bd2:to_css() }
      local tab3 = { fg = fill:to_css(), bg = bd3:to_css(), style = "bold" }
      local tab4 = { fg = fill:to_css(), bg = bd3:to_css(), style = "bold" }

      local tab5 = { fg = light0:to_css(), bg = gd2:to_css(), style = "bold" }

      require("tabby.tabline").set(function(line)
        local theme = {
          fill = fill,
          head = tab1,
          current_tab = tab5,
          tab = tab2,
          win = tab2,
          tail = tab1,
        }

        -- local theme = {
        --   fill = "TabLineFill",
        --   -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
        --   head = "TabLine",
        --   current_tab = { fg = "#F8FBF6", bg = "#896a98", style = "bold" },
        --   -- current_tab = "TabLineSel",
        --   tab = "TabLine",
        --   win = "TabLine",
        --   tail = "TabLine",
        -- }
        return {
          {
            { "  ", hl = theme.head },
            line.sep("", theme.head, theme.fill),
          },
          line.tabs().foreach(function(tab)
            local hl = tab.is_current() and theme.current_tab or theme.tab
            return {
              line.sep("", hl, theme.fill),
              "",
              tab.number(),
              tab.name(),
              line.sep("", hl, theme.fill),
              hl = hl,
              margin = " ",
            }
          end),
          line.spacer(),
          line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
            return {
              line.sep("", theme.win, theme.fill),
              win.is_current() and "" or "",
              win.buf_name(),
              win.buf().is_changed() and "" or "",
              line.sep("", theme.win, theme.fill),
              hl = theme.win,
              margin = " ",
            }
          end),
          {
            line.sep("", theme.tail, theme.fill),
            { " 󰈤 ", hl = theme.tail },
          },
          hl = theme.fill,
        }
      end)
    end,
  },
}
