-- Set <Leader> to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Helper function to map keys
local map = function(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Clear highlights on search when pressing <Esc> in normal mode
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Keybinds to make split navigation easier. Use CTRL+<hjkl> to switch between windows
map('n', '<M-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<M-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<M-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<M-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
-- Use CTRL+<,.> to resize windows horizontally
map('n', '<M-,>', '5<C-w><')
map('n', '<M-.>', '5<C-w>>')
-- Use CTRL+<[,> to resize windows vertically
map('n', '<M-[>', '5<C-w>+')
map('n', '<M-;>', '5<C-w>-')

-- Map Ctrl+S to save in both normal and insert mode
map('n', '<C-s>', ':w<CR>')
map('i', '<C-s>', '<Esc>:w<CR>')

-- Map Shift+Enter to insert newline
map('n', '<S-Enter>', 'o<Esc>')
map('n', '<C-Enter>', 'O<Esc>')

-- Map <leader>+p to SANE pasting
map('n', '<leader>p', '"0p')
map('n', '<leader>P', '"0P')
map('v', '<leader>p', '"0p')
map('v', '<leader>P', '"0P')

-- NGL idk what this is but its in the kickstart so ima keep it in
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
