return {
  "rcarriga/nvim-notify",
  opts = {
    background_colour = "#242628",
    render = "wrapped-compact",
  },
  keys = {
    {
      "<leader>fN",
      function()
        require("notify").history()
      end,
      desc = "Notify message history",
    },
  },
}
