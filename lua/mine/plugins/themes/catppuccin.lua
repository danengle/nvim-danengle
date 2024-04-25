return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- atte, frappe, macchiato, mo
        transparent_background = false,
        highlight_overrides = {
          all = function(colors)
            return {
              CmpBorder = { fg = "#3e4145" },
              NotifyBackground = { bg = colors.mantle },
            }
          end,
        },
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = false,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
          -- For more lugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
          leap = true,
          noice = true,
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
