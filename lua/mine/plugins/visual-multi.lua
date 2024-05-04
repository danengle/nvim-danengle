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
      -- The attempted updates don't map to lua for a reason I don't know
      -- off the top of my head to adapt to. The originals are easy enough though
      -- so leaving this here for now as a little reminder
      -- vim.g.VM_custom_remaps = {
      --   '<c-p>': '[', -- go to previous highlighted/marked word
      --   '<c-s>': 'q' -- after C-n to next word, press q to unselect it from change
      -- }
    end,
  },
}
-- Changed the highlights in the plugin itself since it's vimscript
-- and there was a clearly documented place to make any mods here myself
-- Dropping these here for when I inivitable need to remind myself which
-- ones I chose...
-- " hi default link VM_Mono ErrorMsg
-- " hi default link VM_Cursor Visual
-- " hi default link VM_Extend PmenuSel
-- " hi default link VM_Insert DiffChange
-- hi default link VM_Mono MiniStatuslineModeInsert
-- hi default link VM_Cursor MiniStatuslineModeNormal
-- hi default link VM_Extend MiniStatuslineModeVisual
-- hi default link VM_Insert MiniStatuslineModeOther
-- hi link MultiCursor VM_Cursor
