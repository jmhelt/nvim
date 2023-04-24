local M = {
  "toppair/peek.nvim",
  event = "VeryLazy",
  build = "deno task --quiet build:fast",
  config = function(_, _)
    local peek = require("peek")

    peek.setup({
      auto_load = true,
      close_on_bdelete = true,
      syntax = true,
      theme = "light",
      update_on_change = true,
      app = "webview",
      filetype = { "markdown" },
      throttle_at = 200000,
      throttle_time = "auto",
    })

    vim.api.nvim_create_user_command("PeekOpen", peek.open, {})
    vim.api.nvim_create_user_command("PeekClose", peek.close, {})
  end,
}

return M
