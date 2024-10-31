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

    -- Function to open sidebar if not already open
    local function open_sidebar()
      if vim.fn.winnr('$') == 1 then
        -- If there's only one window, open the sidebar
        vim.cmd("SidebarNvimOpen")
      elseif not vim.tbl_isempty(vim.api.nvim_list_wins()) then
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          local buf = vim.api.nvim_win_get_buf(win)
          if vim.bo[buf].filetype == "sidebar" then
            return -- Sidebar is already open
          end
        end
        vim.cmd("SidebarNvimOpen")
      end
    end

    -- Automatically open Sidebar on VimEnter and when using Telescope
    vim.api.nvim_create_autocmd({"VimEnter", "BufEnter"}, {
      callback = function()
        vim.defer_fn(open_sidebar, 100) -- Delay to allow buffer to settle
      end,
    })
  end,
}

