return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local tree = require("nvim-tree")

      tree.setup({
        hijack_netrw = true
      })

      local function open_nvim_tree()
        require("nvim-tree.api").tree.open()
      end

      vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
    end
  },
}
