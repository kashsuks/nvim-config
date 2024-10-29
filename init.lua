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

-- Set up Lazy.nvim
require("lazy").setup({
  {
    "morhetz/gruvbox",  -- Colorscheme
    lazy = false,       -- Load this plugin immediately
    config = function()
      vim.cmd.colorscheme("gruvbox") -- Apply the colorscheme
    end,
  },
  -- You can add more plugins here
  -- Example:
  -- { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
})

