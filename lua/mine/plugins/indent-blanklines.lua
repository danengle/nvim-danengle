return {
  "lukas-reineke/indent-blankline.nvim",
  dependencies = {
    "catppuccin/nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  opts = {
    indent = { char = "┊" },
  },
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
      local text = mocha.text
      local bg = "#1E2036"
      local red = colors.blend("#D20F39", bg, 0.6)
      local yellow = colors.blend("#DF8E1D", bg, 0.6)
      local blue = colors.blend("#1E66F5", bg, 0.6)
      local orange = colors.blend("#FE640B", bg, 0.6)
      local green = colors.blend("#40A02B", bg, 0.6)
      local violet = colors.blend("#8839EF", bg, 0.6)
      local cyan = colors.blend("#81C8BE", bg, 0.6)
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = red })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = yellow })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = blue })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = orange })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = green })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = violet })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = cyan })
      if true then
        vim.print("")
        vim.print("")
        vim.print("")
        vim.print("")

        if true then
          vim.print("")
          vim.print("")
          vim.print("")
          vim.print("")
          vim.print("")
          vim.print("")
          if true then
            vim.print("")
            vim.print("")
            vim.print("")
            vim.print("")
            vim.print("")
            vim.print("")
            if true then
              vim.print("")
              vim.print("")
              vim.print("")
              vim.print("")
              vim.print("")
              vim.print("")
              if true then
                vim.print("")
                vim.print("")
                vim.print("")
                vim.print("")
                vim.print("")
                vim.print("")
                if true then
                  vim.print("")
                  vim.print("")
                  vim.print("")
                  vim.print("")
                  vim.print("")
                  vim.print("")
                  if true then
                    vim.print("")
                    vim.print("")
                    vim.print("")
                    vim.print("")
                    vim.print("")
                    vim.print("")
                    if true then
                      vim.print("")
                      vim.print("")
                      vim.print("")
                      vim.print("")
                      vim.print("")
                      vim.print("")
                      if true then
                        vim.print("")
                        vim.print("")
                        vim.print("")
                        vim.print("")
                        vim.print("")
                        vim.print("")
                        if true then
                          vim.print("")
                          vim.print("")
                          vim.print("")
                          vim.print("")
                          vim.print("")
                          vim.print("")
                          if true then
                            vim.print("")
                            vim.print("")
                            vim.print("")
                            vim.print("")
                            vim.print("")
                            vim.print("")
                            if true then
                              vim.print("")
                              vim.print("")
                              vim.print("")
                              vim.print("")
                              vim.print("")
                              vim.print("")
                              if true then
                                vim.print("")
                                vim.print("")
                                vim.print("")
                                vim.print("")
                                vim.print("")
                                vim.print("")
                                local red = colors.blend("#D20F39", bg, 0.6)
                                local yellow = colors.blend("#DF8E1D", bg, 0.6)
                                local blue = colors.blend("#1E66F5", bg, 0.6)
                                local orange = colors.blend("#FE640B", bg, 0.6)
                                local green = colors.blend("#40A02B", bg, 0.6)
                                local violet = colors.blend("#8839EF", bg, 0.6)
                                local cyan = colors.blend("#81C8BE", bg, 0.6)
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end)

    require("ibl").setup({ indent = { highlight = highlight } })
  end,
}
