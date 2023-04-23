-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

-- load plugins with lazy.nvim
require("lazy").setup("plugins", {
  defaults = { lazy = true },
  ui = { border = "rounded" },
  checker = { enabled = false },
  debug = false,
})
