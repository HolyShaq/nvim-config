return {
  'catppuccin/nvim',
  'rose-pine/neovim',
  'rebelot/kanagawa.nvim',
  'folke/tokyonight.nvim',
  'sainnhe/everforest',
  'sainnhe/sonokai',
  {
    'cpwrs/americano.nvim',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'americano'
    end,
  },
  'EdenEast/nightfox.nvim',
  'bluz71/vim-moonfly-colors',
  'bluz71/vim-nightfly-colors',
}
