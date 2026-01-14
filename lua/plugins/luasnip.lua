return {
  'L3MON4D3/LuaSnip',
  -- follow latest release.
  version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = 'make install_jsregexp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  config = function()
    require('luasnip.loaders.from_vscode').lazy_load() -- load friendly snippets

    local ls = require 'luasnip'
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local rep = require('luasnip.extras').rep

    local clog = s('clog', {
      t 'console.log("[',
      rep(1),
      t ']", ',
      i(1, ''),
      t ')',
    })

    -- define once
    ls.add_snippets('javascript', { clog })
    ls.add_snippets('typescript', { clog })
    ls.add_snippets('svelte', { clog })
  end,
}
