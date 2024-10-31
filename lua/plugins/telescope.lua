-- lua/plugins/telescope.lua

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",  -- Specify the branch you want
  dependencies = { "nvim-lua/plenary.nvim" },  -- Required dependency
  config = function()
    require("telescope").setup({
      defaults = {
        prompt_prefix = "> ",
        sorting_strategy = "ascending",
        layout_strategy = "flex",
        -- Add more default options as needed
      },
    })

    -- Key mappings for telescope commands
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "List Buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
  end,
}

