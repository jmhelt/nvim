return {
  {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000, -- load this before all the other start plugins
    config = function()
      vim.cmd.colorscheme("sonokai")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    config = true,
  },
  {
    "akinsho/nvim-bufferline.lua",
    version = "v3.*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = true,
  },
}
