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

-- Lazy.nvim setup
require("lazy").setup({
  {
    "morhetz/gruvbox", -- Gruvbox colorscheme
    lazy = false,
    config = function()
      vim.cmd.colorscheme("gruvbox")
      vim.opt.background = "dark"
    end,
  },
  {
    "sidebar-nvim/sidebar.nvim",
    config = function()
      require("sidebar-nvim").setup({
        sections = { "datetime", "git", "diagnostics" },  -- Only include datetime, git, and diagnostics
        datetime = { format = "%a %b %d, %H:%M" },        -- Custom datetime format
        disable_default_keybindings = false,              -- Use default keybindings
      })

      -- Open sidebar only if it's not already open
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          if vim.fn.exists(":SidebarNvimClose") == 2 then
            vim.cmd("SidebarNvimClose")
          end
          vim.cmd("SidebarNvimOpen")
        end,
      })
    end,
  },
  -- Add other plugins if needed
})
