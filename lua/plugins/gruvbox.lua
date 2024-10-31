-- lua/plugins/gruvbox.lua

return {
  "morhetz/gruvbox",
  lazy = false,
  config = function()
    vim.cmd.colorscheme("gruvbox")
    vim.opt.background = "dark"
  end,
}

