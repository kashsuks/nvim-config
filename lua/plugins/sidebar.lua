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

    -- Automatically open Sidebar when a file is opened
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        if vim.fn.argc() > 0 then
          vim.cmd("SidebarNvimOpen")
        else
          vim.cmd("SidebarNvimClose") -- Close the sidebar if no file is open
        end
      end,
    })
  end,
}
