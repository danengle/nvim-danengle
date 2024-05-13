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
      vim.o.showtabline = 2
      local tab_name = require("tabby.feature.tab_name")
      local default_options = {
        name_fallback = function(_) -- tabid
          return ""
        end,
      }
      tab_name.set_default_option(default_options)

      local function format_warn_win(win)
        local redish = "%#PlaygroundBlueBase1Warn01#"
        local norm = "%#PlaygroundBlueBase1#"
        if win.buf().is_changed() then
          return string.format("%s%s%s", redish, "", norm)
        else
          return ""
        end
      end

      local function format_active_win(win)
        local green1 = "%#PlaygroundBlueBase1Success01#"
        local norm = "%#PlaygroundBlueBase1#"
        if win.is_current() then
          return string.format("%s%s%s", green1, "", norm)
        else
          return ""
        end
      end

      local function win_name(win)
        if win.is_current() then
          local hl = "%#PlaygroundBlueBase1Sel#"
          local norm = "%#PlaygroundBlueBase1#"
          return string.format("%s%s%s", hl, win.buf_name(), norm)
        else
          return win.buf_name()
        end
      end

      require("tabby.tabline").set(function(line)
        local theme = {
          fill = "PlaygroundFill",
          head = "PlaygroundBlueBase",
          current_tab = "PlaygroundGreenBaseSel",
          tab = "PlaygroundBlueBase1",
          win = "PlaygroundBlueBase1",
          current_win = "PlaygroundBlueBase1Sel",
          tail = "PlaygroundBlueBase",
        }

        -- TODO: make this work. If neo=tree opens in sidebar, window tab shows
        local function no_neotree(win)
          return not string.match(win.buf_name(), "neo-tree")
        end

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
            local hl = win.is_current() and theme.current_win or theme.win
            return {
              line.sep("", theme.win, theme.fill),
              format_active_win(win),
              win_name(win),
              -- win.buf_name(),
              win.file_icon(),
              format_warn_win(win),
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
