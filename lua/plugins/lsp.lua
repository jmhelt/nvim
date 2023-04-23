local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason-lspconfig.nvim",
    "simrat39/rust-tools.nvim",
  },
  config = function(_, _)
    local cmp_lsp = require("cmp_nvim_lsp")
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local rust_tools = require("rust-tools")

    -- Setup capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities = cmp_lsp.default_capabilities(capabilities)

    mason_lspconfig.setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
          on_attach = function(_, buf)
            -- Enable completion triggered by <c-x><c-o>
            vim.api.nvim_buf_set_option(buf, "omnifunc",
                                        "v:lua.vim.lsp.omnifunc")
          end
        })
      end,
      ["rust_analyzer"] = function(_, _)
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
    })
  end,
}

return M
