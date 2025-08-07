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
      keymaps = {
        ['|'] = { 'actions.select', opts = { vertical = true }, desc = 'Open the entry in a vertical split' },
        ['_'] = { 'actions.select', opts = { horizontal = true }, desc = 'Open the entry in a horizontal split' },
        ['<Esc>'] = { 'actions.close', desc = 'Close oil' },
        ['<C-s>'] = false,
      },
      skip_confirm_for_simple_edits = true,
      delete_to_trash = true,
    }
    vim.keymap.set('n', '-', oil.open_float, { desc = 'Open parent directory' })
  end,
}
