if true then
  return {}
end
return {
  {
    "nvim-zh/colorful-winsep.nvim",
    opts = {
      hi = {
        fg = "#719cd6",
        bg = "#212e3f",
      },
      symbols = { "━", "┃", "╭", "╮", "╰", "╯" },
      smooth = true,
      exponential_smoothing = true,
    },
    config = true,
    event = { "WinNew" },
  },
}
