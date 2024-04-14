if true then
  return {}
end

-- Looked interesting but didn't want to use 's' as the default key
-- to keep it for leap, then didn't think realize b is back a word
-- so just disabling for now and might revisit later

return {
  "gbprod/substitute.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local substitute = require("substitute")

    substitute.setup()

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    vim.keymap.set("n", "b", substitute.operator, { desc = "Substitute with motion" })
    vim.keymap.set("n", "bb", substitute.line, { desc = "Substitute line" })
    vim.keymap.set("n", "B", substitute.eol, { desc = "Substitute to end of line" })
    vim.keymap.set("x", "b", substitute.visual, { desc = "Substitute in visual mode" })
  end,
}
