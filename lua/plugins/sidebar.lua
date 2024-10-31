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

    -- Open sidebar only if it is not already open
    local function open_sidebar()
      if vim.fn.winnr('$') > 1 then
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          local buf = vim.api.nvim_win_get_buf(win)
          if vim.bo[buf].filetype == "sidebar" then
            return -- Sidebar is already open
          end
        end
        vim.cmd("SidebarNvimOpen")
      end
    end

    -- Automatically open Sidebar when a file is opened
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        open_sidebar()
      end,
    })

    -- Automatically close sidebar on BufLeave
    vim.api.nvim_create_autocmd("BufLeave", {
      callback = function()
        if vim.fn.winnr('$') > 1 then
          vim.cmd("SidebarNvimClose")
        end
      end,
    })
  end,
}
