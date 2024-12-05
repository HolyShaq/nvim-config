local map = vim.keymap.set
local defaults = { noremap = true, silent = true }

map('n', '<F4>', '<cmd>:GodotRunLast<CR>', defaults)
map('n', '<F5>', '<cmd>:GodotRun<CR>', defaults)
map('n', '<F6>', '<cmd>:GodotRunCurrent<CR>', defaults)
