return {
  'KadoBOT/nvim-spotify',
  requires = 'nvim-telescope/telescope.nvim',
  config = function()
    local spotify = require 'nvim-spotify'

    local status = spotify.status
    status:start()

    spotify.setup {
      -- default opts
      status = {
        update_interval = 10000, -- the interval (ms) to check for what's currently playing
        format = '  %t', -- spotify-tui --format argument
      },
    }

    require('lualine').setup {
      sections = {
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { status.listen, 'fileformat', 'filetype' },
      },
    }
  end,
  run = 'make',
}
