require("auto-session").setup({
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    session_lens = {
        mappings = {
            delete_session = { 'i', '<C-d>' },
            alternate_session = {'i', '<C-s>' },
            copy_session = {'i', '<C-y>' },
        }
    }
})

vim.keymap.set('n', '<C-s>', '<cmd>SessionSave<CR>')
vim.keymap.set('n', '<leader>sf', '<cmd>SessionSearch<CR>')

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
