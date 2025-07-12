return {
  {
    'akinsho/git-conflict.nvim',
    version = '*',
    opts = {
      highlights = { -- They must have background color, otherwise the default color will be used
        incoming = 'DiffAdd',
        current = 'DiffText',
      },
    },
  },
  {
    'sindrets/diffview.nvim',
    config = function()
      require('diffview').setup {
        keymaps = {
          view = {
            ['<Esc>'] = ':DiffviewClose<CR>',
          },
          file_panel = {
            ['<Esc>'] = ':DiffviewClose<CR>',
          },
        },
      }

      vim.keymap.set('n', '<leader>gdf', ':DiffviewOpen<CR>', { desc = '[G]it [D]i[ff]' })
      vim.keymap.set('n', '<leader>gdm', ':DiffviewOpen origin/main...HEAD<CR>', { desc = '[G]it [D]iff [M]ain' })
      vim.keymap.set('n', '<leader>gds', ':DiffviewFileHistory<CR>', { desc = '[G]it [D]iff [S]tatus' })
    end,
  },
}
