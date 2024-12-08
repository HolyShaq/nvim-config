return {

  -- Color Highlighting
  { 'brenoprata10/nvim-highlight-colors', opts = {} },

  -- { -- Discord Presence
  --   'IogaMaster/neocord',
  --   event = 'VeryLazy',
  --   config = function()
  --     require('neocord').setup {
  --       logo = 'https://cdn2.steamgriddb.com/icon_thumb/0e080857e96278e6dba76ac029faf291.png',
  --       logo_tooltip = 'The universe is, and we are.',
  --     }
  --   end,
  -- },

  -- { -- Presence
  --   'andweeb/presence.nvim',
  --   opts = {
  --     neovim_image_text = 'The universe is, and we are.',
  --   },
  -- },

  {
    'vyfor/cord.nvim',
    build = './build || .\\build',
    event = 'VeryLazy',
    opts = {
      editor = {
        image = 'https://cdn2.steamgriddb.com/icon_thumb/0e080857e96278e6dba76ac029faf291.png',
        tooltip = 'The universe is, and we are.',
      },
    }, -- calls require('cord').setup()
  },

  -- Key Analyzer
  { 'meznaric/key-analyzer.nvim', opts = {} },

  { -- Silly Automata Plugins
    'eandrju/cellular-automaton.nvim',
    config = function()
      vim.keymap.set('n', '<leader>lolr', '<cmd>CellularAutomaton make_it_rain<CR>')
      vim.keymap.set('n', '<leader>lolg', '<cmd>CellularAutomaton game_of_life<CR>')
    end,
  },

  -- Vim-Godot
  { 'habamax/vim-godot', event = 'VimEnter' },
}
