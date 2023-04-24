local M = {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function(_, _)
    vim.g.neo_tree_remove_legacy_commands = 1

    require("neo-tree").setup({})
  end,
}

return M
