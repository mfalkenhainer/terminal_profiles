require('luasnip').setup {}

local cmp = require('blink.cmp')

cmp.build():pwait()
cmp.setup {
    keymap = {
        preset = 'default',
        ['<A-y>'] = require('minuet').make_blink_map(),
    },
    sources = {
        default = {
            'lsp',
            'path',
            'snippets',
            'buffer',
            'minuet'
        },
        providers = {
            minuet = {
                name = 'minuet',
                module = 'minuet.blink',
                async = true,
                timeout_ms = 3000,
                score_offset = 50,
            }
        }
    },
    completion = {
        trigger = {
            prefetch_on_insert = false
        }
    },
    fuzzy = {
        implementation = 'rust'
    }
}
