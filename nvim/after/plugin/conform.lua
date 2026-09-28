require('conform').setup {
    formatters_by_ft = {
        rust = { 'rustfmt' },
        javascript = { 'eslint_d', 'prettier' },
        typescript = { 'eslint_d', 'prettier' },
        javascriptreact = { 'eslint_d', 'prettier' },
        typescriptreact = { 'eslint_d', 'prettier' }
    },
    formatters = {
        rustfmt = {
            prepend_args = { '+nightly' },
        },
    },
}

vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*',
    callback = function(args)
        require('conform').format({ bufnr = args.buf })
    end
})
