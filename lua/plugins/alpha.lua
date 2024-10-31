return {
  "goolord/alpha-nvim",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
      "                                                     ",
      "  ██╗  ██╗ █████╗ ███████╗██╗  ██╗██╗   ██╗ █████╗ ██████╗  ",
      "  ██║ ██╔╝██╔══██╗██╔════╝██║  ██║╚██╗ ██╔╝██╔══██╗██╔══██╗ ",
      "  █████╔╝ ███████║███████╗███████║ ╚████╔╝ ███████║██████╔╝ ",
      "  ██╔═██╗ ██╔══██║╚════██║██╔══██║  ╚██╔╝  ██╔══██║██╔═══╝  ",
      "  ██║  ██╗██║  ██║███████║██║  ██║   ██║   ██║  ██║██║      ",
      "  ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝      ",
      "                                                     ",
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "  New file", ":enew<CR>"),
      dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
      dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
      dashboard.button("s", "  Settings", ":e $MYVIMRC<CR>"),
      dashboard.button("u", "  Update plugins", ":Lazy update<CR>"), -- Fixed command
      dashboard.button("q", "  Quit", ":qa<CR>"),
    }

    -- Set footer
    local function footer()
      local total_plugins = #vim.tbl_keys(require("lazy").plugins())
      local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
      local version = vim.version()
      return string.format("🎈 %d plugins loaded   %s   v%d.%d.%d", 
        total_plugins, datetime, version.major, version.minor, version.patch)
    end

    dashboard.section.footer.val = footer()

    -- Set header padding
    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Keyword"
    dashboard.section.footer.opts.hl = "Type"

    dashboard.config.opts.noautocmd = true

    -- Send config to alpha
    alpha.setup(dashboard.config)

    -- Auto open alpha when no files are specified
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        local should_skip = false
        if vim.fn.argc() > 0 or vim.fn.line2byte('$') ~= -1 or not vim.o.modifiable then
          should_skip = true
        else
          for _, arg in pairs(vim.v.argv) do
            if arg == "-b" or arg == "-c" or vim.startswith(arg, "+") or arg == "-S" then
              should_skip = true
              break
            end
          end
        end
        if not should_skip then
          alpha.start(true)
        end
      end,
    })
  end,
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
