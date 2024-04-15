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
