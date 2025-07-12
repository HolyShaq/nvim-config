-- lualine
-- https://github.com/nvim-lualine/lualine.nvim

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      theme = 'horizon',
      options = {
        sections = {
          lualine_c = { { 'filename', path = 2 } },
        },
        disabled_filetypes = {
          statusline = { 'alpha' },
        },
      },
    }
  end,
}
