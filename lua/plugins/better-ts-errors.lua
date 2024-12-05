-- better-ts-errors
-- https://github.com/OlegGulevskyy/better-ts-errors.nvim/tree/main

return {
  'OlegGulevskyy/better-ts-errors.nvim',
  dependencies = { 'MunifTanjim/nui.nvim' },
  config = {
    keymaps = {
      toggle = '<leader>tsd', -- default '<leader>dd'
      go_to_definition = '<leader>tsg', -- default '<leader>dx'
    },
  },
}
