local snacks = require('snacks')

snacks.setup {
    opts = {
        terminal = {
            enabled = true
        }
    }
}

vim.keymap.set('n', '<leader>tt', function ()
    snacks.terminal.toggle()
end, { desc = 'Toggle Terminal' })
vim.keymap.set('n', '<leader>tb', function ()
    snacks.terminal.open(nil, {
        win = {
            position = "current"
        }
    })
end, { desc = 'Open in Current Buffer' })
vim.keymap.set('n', '<leader><Tab>t', function ()
    vim.cmd('tabnew')

    snacks.terminal.open(nil, {
        win = {
            position = "current"
        }
    })
end, { desc = 'New Terminal Tab' })
