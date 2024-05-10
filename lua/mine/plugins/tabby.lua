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
      local api = require("tabby.module.api")
      local tab_name = require("tabby.feature.tab_name")
      local default_options = {
        name_fallback = function(_) -- tabid
          return ""
        end,
      }
      tab_name.set_default_option(default_options)

      require("tabby.tabline").set(function(line)
        local theme = {
          fill = "TabLineFill",
          -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
          head = "TabLine",
          current_tab = "TabLineSel",
          tab = "TabLine",
          win = "TabLine",
          tail = "TabLine",
        }
        return {
          {
            { "  ", hl = theme.head },
            -- line.sep("", theme.head, theme.fill),
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
              win.buf().is_changed() and "󱡝" or "",
              line.sep("", theme.win, theme.fill),
              hl = theme.win,
              margin = " ",
            }
          end),
          {
            line.sep("", theme.tail, theme.fill),
            { "  ", hl = theme.tail },
          },
          hl = theme.fill,
        }
      end)

      -- require("tabby.tabline").use_preset("active_wins_at_tail", {
      --   theme = {
      --     fill = "TabLineFill", -- tabline background
      --     head = "TabLine", -- head element highlight
      --     current_tab = "TabLineSel", -- current tab label highlight
      --     tab = "TabLine", -- other tab label highlight
      --     win = "TabLine", -- window highlight
      --     tail = "TabLine", -- tail element highlight
      --   },

      --   nerdfont = true, -- whether use nerdfont
      --   lualine_theme = "nightfox", -- lualine theme name
      --   tab_name = {
      --     name_fallback = function(_) -- tabid
      --       return ""
      --     end,
      --   },
      --   buf_name = {
      --     mode = "tail", --"'unique'|'relative'|'tail'|'shorten'",
      --   },
      -- })
    end,
  },
}
