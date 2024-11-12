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

  -- Presence
  { 'andweeb/presence.nvim', opts = {} },

  -- Key Analyzer
  { 'meznaric/key-analyzer.nvim', opts = {} },
}
