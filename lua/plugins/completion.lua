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
      -- Neodev
      "folke/neodev.nvim",
      -- Rust Tools
      "simrat39/rust-tools.nvim",
    },
    config = function()
      local lsp = require("lsp-zero")
      local neodev = require("neodev")
      local rust_tools = require("rust-tools")

      -- IMPORTANT: Must setup neodev before lspconfig
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
        "gopls",
        "lua_ls",
        "rust_analyzer"
      })

      lsp.skip_server_setup({ "rust_analyzer" })

      lsp.setup()

      -- IMPORTANT: Setup rust-tools after lsp-zero
      rust_tools.setup({
        server = {
          on_attach = function(_, buf)
            vim.keymap.set("n", "<leader>ca",
                           rust_tools.hover_actions.hover_actions,
                           { buffer = buf })
          end
        }
      })
    end
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
    },
  },
  {
    "saadparwaiz1/cmp_luasnip",
    dependencies = {
      "L3MON4D3/LuaSnip",
    }
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    config = false,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
	    "williamboman/mason-lspconfig.nvim",
    },
    config = false,
  },
  {
	  "williamboman/mason-lspconfig.nvim",
	  dependencies = {
	    "williamboman/mason.nvim",
    },
    config = false,
  },
  {
	  "williamboman/mason.nvim",
    build = function()
      pcall(vim.cmd, "MasonUpdate")
    end,
    config = false,
	},
  {
    "simrat39/rust-tools.nvim",
    config = false,
  },
}
