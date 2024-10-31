-- lua/plugins/sidebar.lua

return {
  "sidebar-nvim/sidebar.nvim",
  lazy = false,
  config = function()
    require("sidebar-nvim").setup({
      sections = { "datetime", "git", "diagnostics" },
      datetime = { format = "%a %b %d, %H:%M" },
      disable_default_keybindings = false,
    })

    -- Automatically open Sidebar when Neovim starts
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        vim.cmd("SidebarNvimOpen")
      end,
    })
  end,
}

