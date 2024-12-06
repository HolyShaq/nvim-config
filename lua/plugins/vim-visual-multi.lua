return {
  'mg979/vim-visual-multi',
  event = 'VeryLazy',
  config = function()
    vim.g.VM_default_mappings = 0
    vim.g.VM_maps = {
      ['Find Under'] = '',
    }
    vim.g.VM_add_cursor_at_pos_no_mappings = 1

    vim.keymap.set('n', '<leader>m', '<Plug>(VM-Add-Cursor-At-Pos)', { desc = 'Add Cursor at Pos' })
    vim.keymap.set('n', '<leader>M', '<Plug>(VM-Toggle-Mappings)', { desc = 'Toggle Mappings' })
    vim.keymap.set('v', '<leader>m', '<Plug>(VM-Visual-Cursors)', { desc = 'Add Cursors' })
  end,
}
