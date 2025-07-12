-- VimTeX
-- https://github.com/lervag/vimtex

vim.cmd 'syntax on'
vim.cmd 'filetype plugin indent on'

return {
  'lervag/vimtex',
  lazy = false, -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_general_viewer = 'okular'
    vim.g.vimtex_view_general_options = [[--unique "file:@pdf#src:@line@tex"]]
    vim.g.vimtex_quickfix_ignore_filters = {
      'Warning',
    }
  end,
}
