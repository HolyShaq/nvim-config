-- toggleterm
-- https://github.com/akinsho/toggleterm.nvim

return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    -- Run pwsh command
    require('toggleterm').setup {
      open_mapping = [[<c-\>]],
      direction = 'float',
    }
  end,
}
