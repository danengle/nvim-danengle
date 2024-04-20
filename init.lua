require("mine.core")
require("mine.lazy")

local noice = require("noice")

local ver = vim.inspect(vim.version())
local minor = vim.inspect(vim.version()["minor"])
local patch = vim.inspect(vim.version()["patch"])

local smushed = minor .. "." .. patch
noice.notify(ver, vim.log.levels.INFO, {
  title = "Vim Version",
  icon = "",
})
noice.notify(smushed, vim.log.levels.INFO, {
  title = "Vim Version",
  icon = "",
})

-- Astro has this snippet...use it to figure out best way to
-- notify above and if nvim version even really matters...
-- function M.init()
--   if vim.fn.has "nvim-0.9" == 0 then
--     vim.api.nvim_echo({
--       { "AstroNvim requires Neovim >= 0.9.0\n", "ErrorMsg" },
--       { "Press any key to exit", "MoreMsg" },
--     }, true, {})
--     vim.fn.getchar()
--     vim.cmd.quit()
--   end
--
--   if M.did_init then return end
--   M.did_init = true
--
--   lazy_notify()
