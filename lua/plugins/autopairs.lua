local M = {
  "windwp/nvim-autopairs",
  dependencies = "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  opts = {
    check_ts = true,
  },
  config = function(_, _)
    local cmp = require("cmp")
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local npairs = require("nvim-autopairs")

    npairs.setup({
      check_ts = true,
    })

    -- Insert `(` after select function or method item
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}

return M
