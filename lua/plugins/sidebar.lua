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
        local sidebarOpen = vim.fn.getwininfo(vim.fn.win_getid())[1].bufnr == vim.fn.bufnr('sidebar')
        
        if vim.fn.argc() > 0 and not sidebarOpen then
          vim.cmd("SidebarNvimOpen")
        elseif vim.fn.argc() == 0 and sidebarOpen then
          vim.cmd("SidebarNvimClose") -- Close the sidebar if no file is open
        end
      end,
    })
  end,
}

