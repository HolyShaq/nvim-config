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
map('n', '<C-S>', ':w!<CR>')
map('i', '<C-s>', '<Esc>:w<CR>')
map('i', '<C-S>', '<Esc>:w!<CR>')

-- Unmap F1
map('n', '<F1>', '', { noremap = true })

-- Map Shift+Enter to insert newline
map('n', '<S-Enter>', 'o<Esc>')
map('n', '<C-Enter>', 'O<Esc>')

-- Map <leader>+p to SANE pasting
map('n', '<leader>p', '"0p', { desc = 'Sane pasting' })
map('n', '<leader>P', '"0P', { desc = 'Sane pasting' })
map('v', '<leader>p', '"0p', { desc = 'Sane pasting' })
map('v', '<leader>P', '"0P', { desc = 'Sane pasting' })

-- Move selected lines with shift+j or shift+k
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Buffer controls
map('n', '<leader>bd', '<Cmd>bd<CR>', { desc = 'Delete buffer' })
map('n', '<leader>bD', '<Cmd>bd!<CR>', { desc = 'Delete buffer!!!' })
map('n', '<leader>bc', '<Cmd>%bd!<CR><Cmd>Alpha<CR>', { desc = 'Clear all buffers' })

-- Tailwind controls
map('n', '<leader>twt', ':TailwindConcealToggle<CR>', { desc = 'Toggle tailwind conceal' })
map('n', '<leader>tws', ':TailwindSort<CR>', { desc = 'Sort tailwind' })

-- Neovide
map('n', '<M-Enter>', function()
  vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
end, { desc = 'Toggle Neovide Fullscreen' })

-- Copy path keymaps
map('n', '<leader>yc', ':let @+ = getcwd()<CR>', { desc = 'Copy current working directory' })
map('n', '<leader>yb', ':let @+ = expand("%:.:h")<CR>', { desc = 'Copy buffer directory' })
map('n', '<leader>yf', ':let @+ = expand("%:.")<CR>', { desc = 'Copy file path' })
map('n', '<leader>yx', function()
  local relpath = vim.fn.fnamemodify(vim.fn.expand '%', ':.')
  local filetype = vim.bo.filetype or ''
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local content = table.concat(lines, '\n')
  local formatted = string.format('File: %s\n```%s\n%s\n```', relpath, filetype, content)

  vim.fn.setreg('+', formatted)
  print('Copied context for ' .. relpath)
end, { desc = 'Copy full file context' })
map('v', '<leader>yx', function()
  local relpath = vim.fn.fnamemodify(vim.fn.expand '%', ':.')
  local filetype = vim.bo.filetype or ''

  -- Get the 1-based line numbers of the visual selection
  local _start = vim.fn.getpos(".")
  local _end = vim.fn.getpos("v")

  local lines = vim.fn.getregion(_start, _end)

  local content = table.concat(lines, '\n')
  local formatted = string.format('File: %s\n```%s\n%s\n```', relpath, filetype, content)

  vim.fn.setreg('+', formatted)
  print('Copied ' .. #lines .. ' lines of context for ' .. relpath)
end, { desc = 'Copy context' })

-- NGL idk what this is but its in the kickstart so ima keep it in
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
