return {
  {
    "echasnovski/mini.nvim",
    version = false,
  },
  {
    "echasnovski/mini.bufremove",
    keys = {
      {
        "<leader>bd",
        function()
          local bd = require("mini.bufremove").delete
          if vim.bo.modified then
            local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
            if choice == 1 then -- Yes
              vim.cmd.write()
              bd(0)
            elseif choice == 2 then -- No
              bd(0, true)
            end
          else
            bd(0)
          end
        end,
        desc = "Delete Buffer",
      },
      {
        "<leader>bD",
        function()
          require("mini.bufremove").delete(0, true)
        end,
        desc = "Delete Buffer (Force)",
      },
      {
        "<leader>bQ",
        function()
          local bufrem = require("mini.bufremove")
          local notify = require("notify")
          local current = vim.api.nvim_get_current_buf()
          for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
            if vim.api.nvim_buf_is_loaded(bufnr) and current ~= bufnr then
              notify("Closing buffer " .. bufnr, vim.log.levels.INFO)
              bufrem.delete(bufnr)
            end
          end
        end,
        desc = "Close all (as many as able) buffers but not current",
      },
    },
  },
  -- Animate was causing scroll hiccups and I didn't feel like diving
  -- into what the repo said to do to fix at the time...
  -- {
  --   "echasnovski/mini.animate",
  --   version = false,
  --   dependencies = {
  --     "echasnovski/mini.nvim",
  --   },
  --   config = true,
  -- },
}
