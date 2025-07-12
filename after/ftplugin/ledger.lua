-- General Config
vim.opt.tabstop = 4 -- Tab size
vim.opt.shiftwidth = 4 -- Shift size
vim.opt.list = false

-- Snippets
local luasnip = require 'luasnip'
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

luasnip.add_snippets('ledger', {
  s('txn', {
    t(os.date '%Y-%m-%d' .. ' '),
  }),

  s('price', {
    t('P ' .. os.date '%Y-%m-%d' .. ' '),
  }),
})

local wk = require("which-key")
 
wk.add({
  { "<leader>hl", group = "Hledger" },
  { "<leader>hlb", group = "Hledger Buffer Align" }, -- group
})

-- Keymaps
vim.keymap.set('n', '<leader>hlba', '<cmd>LedgerAlignBuffer<CR>', { desc = '[H][L]edger [B]uffer [A]lign' })
vim.keymap.set('v', '<leader>hla', ":'<,'>LedgerAlign<CR>", { desc = '[H][L]edger [A]lign' })
vim.keymap.set('n', '<leader>hlp', [[:%s/$\(\d\+.\d\+\)/\1 USD/g<CR>]], { desc = '[H][L]edger Correct [P]rice Format' })
-- vim.keymap.set('n', '<leader>hlf', [[:%s/$\(\d\+.\d\+\)/\1 USD/g<CR>]], { desc = '[H][L]edger [F]ix Stupid Git ^Ms' })
