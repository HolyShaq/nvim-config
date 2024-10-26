-- lualine
-- https://github.com/nvim-lualine/lualine.nvim

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      theme = 'horizon',
      options = {
        disabled_filetypes = {
          statusline = { 'alpha' },
        },
      },
    }
  end,
}
