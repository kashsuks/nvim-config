
-- init.lua

-- Ensure Lazy.nvim is installed and loaded
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugin configurations
require("plugins.init")

-- Run Lazy sync automatically on startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("lazy").sync()
  end,
})

