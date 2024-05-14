return {
  {
    "mg979/vim-visual-multi",
    keys = {
      { "<leader>ma", "<Plug>(VM-Select-All)<Tab>", desc = "Select All" },
      { "<leader>mr", "<Plug>(VM-Start-Regex-Search)", desc = "Start regex search" },
      { "<leader>mp", "<Plug>(VM-Add-Cursor-At-Pos)", desc = "Add cursor at position" },
      { "<leader>mo", "<Plug>(VM-Toggle-Mappings)", desc = "Toggle mapping" },
      {
        "<leader>mv",
        function()
          vim.cmd('silent! execute "normal! \\<Plug>(VM-Visual-Cursors)"')
          vim.cmd("sleep 200m")
          vim.cmd('silent! execute "normal! A"')
        end,
        desc = "Toggle mapping",
        mode = "v",
      },
    },
    config = function()
      -- chose , to remap from \ since it seems like the other leader key
      -- but then creator/maintainer said Motion should also be remapped
      -- to avoid any unnecessary delays
      vim.g.VM_leader = ","
      vim.g.VM_maps["Motion ,"] = ",,"
      vim.g.VM_default_mappings = 0
      vim.g.VM_add_cursor_at_pos_no_mappings = 1
    end,
  },
}
