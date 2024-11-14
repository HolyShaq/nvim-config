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

  { -- Discord Presence
    'IogaMaster/neocord',
    event = 'VeryLazy',
    config = function()
      require('neocord').setup {
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
}
