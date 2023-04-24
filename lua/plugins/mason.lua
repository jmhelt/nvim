local M = {
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
    },
    opts = {
      ensure_installed = {
        "lua_ls",
        "marksman",
        "rust_analyzer",
      }
    },
  },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = true,
  },
}

return M
