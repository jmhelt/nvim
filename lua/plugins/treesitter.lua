local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPost",
  opts = {
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    autopairs = { enable = true },
    autotag = { enable = true },
    indent = { enable = true },
    ensure_installed = "all",
    sync_install = true,
    ignore_install = {},
    refactor = {
      highlight_definitions = {
        enable = true,
        clear_on_cursor_move = true,
      },
      highlight_current_scope = { enable = false },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}

return M
