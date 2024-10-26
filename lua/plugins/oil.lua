-- oil
-- https://github.com/stevearc/oil.nvim

return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  -- dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if prefer nvim-web-devicons
  config = function()
    local oil = require 'oil'
    oil.setup {
      skip_confirm_for_simple_edits = true,
      delete_to_trash = true,
    }
    vim.keymap.set('n', '-', oil.open_float, { desc = 'Open parent directory' })
    vim.keymap.set('n', 'q', oil.close, { desc = 'Close oil' })
  end,
}
