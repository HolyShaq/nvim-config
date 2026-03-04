-- Settings specifically for PHP / WordPress development

-- WordPress Coding Standards: Use real tabs
vim.opt_local.expandtab = false
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4

-- Enable line wrapping for long HTML/PHP mixes
vim.opt_local.wrap = true

-- Set a commentstring that works well with plugins like Comment.nvim
vim.opt_local.commentstring = "/* %s */"

-- Optional: Add a shortcut to open the WordPress documentation
-- Pressing 'K' on a function name will search it on developer.wordpress.org
vim.keymap.set('n', 'K', function()
  local word = vim.fn.expand('<cword>')
  local url = 'https://developer.wordpress.org/?s=' .. word
  os.execute('open ' .. url) -- Use 'xdg-open' on Linux or 'start' on Windows
end, { buffer = true, desc = 'Search WP Docs' })
