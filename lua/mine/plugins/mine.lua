return {
  dir = "$XDG_CONFIG_HOME/nvim/lua/mine/playground",
  lazy = false,
  dependencies = {
    "EdenEast/nightfox.nvim",
  },
  config = function()
    local playground = require("playground")
    playground.setup({})
  end,
}
