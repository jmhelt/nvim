return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      -- LSP Support
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      -- Autocompletion
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      -- Snippets
      "L3MON4D3/LuaSnip",
      -- Neodev
      "folke/neodev.nvim"
    },
    config = function()
      local lsp = require("lsp-zero")
      local neodev = require("neodev")

      -- IMPORTANT: setup neodev BEFORE lspconfig
      neodev.setup({
        types = true
      })

      lsp.set_preferences({
        suggest_lsp_servers = false,
        setup_servers_on_start = true,
        set_lsp_keymaps = true,
        configure_diagnostics = true,
        cmp_capabilities = true,
        manage_nvim_cmp = true,
        call_servers = "local",
        sign_icons = {
          error = "✘",
          warn = "▲",
          hint = "⚑",
          info = "",
        },
      })

      lsp.on_attach(function(_, buf)
          lsp.default_keymaps({ buffer = buf })
      end)

      lsp.ensure_installed({
        "lua_ls",
        "gopls"
      })

      lsp.setup()
    end
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
    },
  },
  {
    "saadparwaiz1/cmp_luasnip",
    dependencies = {
      "L3MON4D3/LuaSnip"
    }
  },
  {
	  "williamboman/mason-lspconfig.nvim",
	  dependencies = {
	    "williamboman/mason.nvim",
    },
  },
  {
	  "williamboman/mason.nvim",
    build = function()
      pcall(vim.cmd, "MasonUpdate")
    end,
    config = true,
	},
}
