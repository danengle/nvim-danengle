if true then
  return {}
end

return {
  "ggandor/leap.nvim",
  config = function()
    require("leap").create_default_mappings()
  end,
}
