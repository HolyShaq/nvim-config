return {
  { -- Smooth Cursor
    'gen740/SmoothCursor.nvim',
    config = function()
      require('smoothcursor').setup {
        intervals = 10,
        speed = 15,
      }
    end,
  },

  -- Color Highlighting
  { 'brenoprata10/nvim-highlight-colors', opts = {} },

  -- Transparency
  { 'xiyaowong/transparent.nvim', opts = {} },

  { -- Discord Presence
    'IogaMaster/neocord',
    event = 'VeryLazy',
    config = function()
      require('neocord').setup {
        logo = 'https://cdn2.steamgriddb.com/icon_thumb/0e080857e96278e6dba76ac029faf291.png',
        logo_tooltip = 'The universe is, and we are.',
      }
    end,
  },

  -- { -- Presence
  --   'andweeb/presence.nvim',
  --   opts = {
  --     neovim_image_text = 'The universe is, and we are.',
  --   },
  -- },

  -- Key Analyzer
  { 'meznaric/key-analyzer.nvim', opts = {} },

  { -- Silly Automata Plugins
    'eandrju/cellular-automaton.nvim',
    config = function()
      vim.keymap.set('n', '<leader>lolr', '<cmd>CellularAutomaton make_it_rain<CR>')
      vim.keymap.set('n', '<leader>lolg', '<cmd>CellularAutomaton game_of_life<CR>')
    end,
  },
}
