return {
  {
    'gen740/SmoothCursor.nvim',
    config = function()
      require('smoothcursor').setup {
        intervals = 10,
        speed = 15,
      }
    end,
  },
}
