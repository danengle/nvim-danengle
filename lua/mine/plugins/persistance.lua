return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  opts = {
    -- add any custom options here
    "globals",
  },
  pre_save = function()
    vim.api.nvim_exec_autocmds("User", { pattern = "SessionSavePre" })
  end,
}
