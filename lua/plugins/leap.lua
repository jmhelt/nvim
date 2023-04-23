local M = {
  "ggandor/leap.nvim",
  event = "VeryLazy",
  config = function(_, _)
    require("leap").add_default_mappings()
  end,
}

return M
