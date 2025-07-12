-- neocodeium
-- https://github.com/monkoose/neocodeium

return {
  'monkoose/neocodeium',
  event = 'VeryLazy',
  config = function()
    local neocodeium = require 'neocodeium'
    neocodeium.setup()
    -- Accept
    vim.keymap.set('i', '<A-o>', neocodeium.accept)

    -- Accept line
    vim.keymap.set('i', '<A-i>', neocodeium.accept_line)

    -- Cycle forwards and backwards
    -- vim.keymap.set('i', '<A-0>', function()
    --   require('neocodeium').sycle_or_complete()
    -- end)
    vim.keymap.set('i', '<A-0>', function()
      require('neocodeium').cycle_or_complete(-1)
    end)

    -- Clear suggestions
    vim.keymap.set('i', '<A-8>', neocodeium.clear)

    -- Open chat
    vim.keymap.set('n', '<leader>cdc', '<cmd>NeoCodeium chat<cr>', { silent = true })

    -- Toggle Codeium for the buffer
    vim.keymap.set('n', '<A-O>', '<cmd>NeoCodeium toggle<cr>', { silent = true })
  end,
}
