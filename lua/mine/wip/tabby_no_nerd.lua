-- https://github.com/nanozuki/tabby.nvim/discussions/24
require("tabby").setup()
local filename = require("tabby.filename")
local util = require("tabby.util")

local hl_tabline = util.extract_nvim_hl("TabLine")
local hl_tabline_sel = util.extract_nvim_hl("TabLineSel")

---@type TabbyTablineOpt
local tabline = {
  hl = "TabLineFill",
  layout = "active_wins_at_tail",
  active_tab = {
    label = function(tabid)
      return {
        "  "
          .. vim.api.nvim_tabpage_get_number(tabid)
          .. " ["
          .. table.getn(vim.api.nvim_tabpage_list_wins(tabid))
          .. "] ",
        hl = { fg = hl_tabline.fg, bg = hl_tabline.bg, style = "bold" },
      }
    end,
    right_sep = { " ", hl = "TabLineFill" },
  },
  inactive_tab = {
    label = function(tabid)
      return {
        "  "
          .. vim.api.nvim_tabpage_get_number(tabid)
          .. " ["
          .. table.getn(vim.api.nvim_tabpage_list_wins(tabid))
          .. "] ",
        hl = { fg = hl_tabline_sel.fg, bg = hl_tabline_sel.bg, style = "bold" },
      }
    end,
    right_sep = { " ", hl = "TabLineFill" },
  },
  top_win = {
    label = function(winid)
      return {
        " > "
          .. vim.api.nvim_win_get_buf(winid)
          .. ": "
          .. filename.unique(winid)
          .. " "
          .. (vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(winid), "modified") and "[+]" or ""),
        hl = { fg = hl_tabline.fg, bg = hl_tabline.bg, style = "bold" },
      }
    end,
    left_sep = { " ", hl = "TabLineFill" },
  },
  win = {
    label = function(winid)
      return {
        " - "
          .. vim.api.nvim_win_get_buf(winid)
          .. ": "
          .. filename.unique(winid)
          .. " "
          .. (vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(winid), "modified") and "[+]" or ""),
        hl = { fg = hl_tabline_sel.fg, bg = hl_tabline_sel.bg },
      }
    end,
    left_sep = { " ", hl = "TabLineFill" },
  },
}

require("tabby").setup({
  tabline = tabline,
})
