local M = {
  "loctvl842/monokai-pro.nvim",
  --"sainnhe/sonokai",
  lazy = false,
  priority = 1000, -- load before all the other start plugins
  config = function(_, _)
    require("monokai-pro").setup()

    vim.cmd([[colorscheme monokai-pro]])
  end
}

return M
