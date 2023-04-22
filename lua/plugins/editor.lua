return {
  {
    "lukas-reineke/indent-blankline.nvim", -- Show indentation lines
    config = true,
  },
  {
    "tpope/vim-surround" -- Surround easily text with quotes, parentheses, etc.
  },
  {
    "tpope/vim-commentary" -- Comment lines easily
  },
  {
    "tpope/vim-unimpaired" -- Handy bracket mappings
  },
  {
    "windwp/nvim-autopairs", -- Autopair quotes, parentheses, etc.
    config = function()
      require("nvim-autopairs").setup({})
    end
  },
}
