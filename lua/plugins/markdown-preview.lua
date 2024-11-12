-- Markdown preview
-- https://github.com/iamcco/markdown-preview.nvim

return {
  'iamcco/markdown-preview.nvim',
  config = function()
    vim.fn['mkdp#util#install']()
  end,
}
