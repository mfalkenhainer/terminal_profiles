vim.keymap.set('n', '<leader>fe', function ()
    require('yazi').yazi()
end, { desc = 'File explorer' })
