-- tiny-inline-diagnostic
-- https://github.com/rachartier/tiny-inline-diagnostic

return {
  'rachartier/tiny-inline-diagnostic.nvim',
  event = 'VeryLazy', -- Or `LspAttach`
  priority = 1000, -- needs to be loaded in first
  config = function()
    require('tiny-inline-diagnostic').setup()
    vim.diagnostic.config { virtual_text = false }
  end,
}
