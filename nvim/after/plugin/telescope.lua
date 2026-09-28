require('telescope').setup {
    extensions = {
        ['ui-select'] = {
            require('telescope.themes').get_dropdown {}
        }
    }
}
require('telescope').load_extension('ui-select')
require('telescope').load_extension('live_grep_args')
require('telescope').load_extension('git_worktree')
local builtin = require('telescope.builtin')

-- Ignore paths
local grep_args = {
    "--glob",
    "!*test*",
    "--glob",
    "!*spec*",
    "--glob",
    "!*md"
}

vim.keymap.set('n', '<leader>ff', function()
    local is_git = os.execute('git') == 0
    if is_git then
        builtin.git_files()
    else
        builtin.find_files()
    end
end, {desc = 'Find files'})
vim.keymap.set('n', '<leader>fg', function()
    builtin.live_grep({
        additional_args = grep_args
    })
end, {desc = 'Live grep'})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = 'Telescope help tags'})
vim.keymap.set('n', '<leader>fb', function()
    builtin.buffers({
        sort_mru = true,
        ignore_current_buffer = true,
        show_all_buffers = true,
    })
end, {desc = 'Telescope buffers'})

vim.keymap.set('n', '<leader>fs', function ()
    builtin.grep_string({
        search = vim.fn.input('Grep > ')
    });
end, {desc = 'Inline live grep'})

vim.keymap.set('v', '<leader>fv', function ()
    require('telescope-live-grep-args.shortcuts').grep_visual_selection()
end, {desc = 'Live grep with selection'})

vim.keymap.set('n', '<leader>ft', function ()
    require('telescope').extensions.git_worktree.git_worktrees()
end, { desc = 'Find worktree' })
