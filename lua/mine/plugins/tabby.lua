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
            notify("Unable to rename tab with blank input", vim.log.levels.ERROR, { title = "Tabby:" })
          else
            tabby.tab_rename(tab_name)
          end
        end,
        desc = "Rename current tab",
      },
    },
    config = function()
      require("tabby.tabline").use_preset("active_wins_at_tail", {
        theme = {
          fill = "TabLineFill", -- tabline background
          head = "TabLine", -- head element highlight
          current_tab = "TabLineSel", -- current tab label highlight
          tab = "TabLine", -- other tab label highlight
          win = "TabLine", -- window highlight
          tail = "TabLine", -- tail element highlight
        },
        nerdfont = true, -- whether use nerdfont
        lualine_theme = "nightfox", -- lualine theme name
        tab_name = {
          name_fallback = function(tabid)
            return tabid
          end,
        },
        buf_name = {
          mode = "'unique'|'relative'|'tail'|'shorten'",
        },
      })
    end,
  },
}
