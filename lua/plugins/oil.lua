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

    -- Autocmd that binds <Esc> to close Oil only when it's open
    vim.api.nvim_create_autocmd('User', {
      pattern = 'OilEnter',
      callback = function()
        vim.keymap.set('n', '<Esc>', oil.close, { buffer = 0, desc = 'Close oil' })
      end,
    })
  end,
}
