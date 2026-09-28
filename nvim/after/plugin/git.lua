local gs = require('gitsigns')
gs.setup {}

vim.keymap.set('n', '<leader>gpo', '<cmd>DiffviewOpen<cr>', { desc = 'Open Git Diff' })
vim.keymap.set('n', '<leader>gpc', '<cmd>DiffviewClose<cr>', { desc = 'Close Git Diff' })
vim.keymap.set('n', '<leader>gf', '<cmd>vertical Git<cr>', { desc = 'Toggle file panel' })

vim.keymap.set('n', ']c', function ()
    if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
    else
        gs.nav_hunk("next")
    end
end, { desc = 'Next Change' })
vim.keymap.set('n', '[c', function ()
    if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
    else
        gs.nav_hunk("prev")
    end
end, { desc = 'Previous Change' })
vim.keymap.set('n', ']C', function() gs.nav_hunk("last") end, { desc = 'Last change' })
vim.keymap.set('n', '[C', function() gs.nav_hunk("first") end, { desc = 'First change' })

local worktree = require('git-worktree')
worktree.setup {}

vim.keymap.set('n', '<leader>gtc', function()
    local input = vim.fn.input({ prompt = 'Worktree name: ' })

    if input == nil or input == "" then return end

    worktree.create_worktree(input, input, 'origin')
end, { desc = 'Create worktree' })
vim.keymap.set('n', '<leader>gts', function()
    local input = vim.fn.input({ prompt = 'Worktree name: ' })

    if input == nil or input == "" then return end

    worktree.switch_worktree(input)
end, { desc = 'Switch worktree' })
vim.keymap.set('n', '<leader>gtd', function()
    local input = vim.fn.input({ prompt = 'Worktree name: ' })

    if input == nil or input == "" then return end

    worktree.delete_worktree(input)
end, { desc = 'Delete worktree' })
