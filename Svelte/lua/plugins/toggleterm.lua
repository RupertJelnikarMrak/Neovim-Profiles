require('toggleterm').setup{
    open_mapping = [[<C-\>]],
}

vim.keymap.set('t', '<Esc>', function() vim.api.nvim_command("stopinsert") end, { noremap = true, silent = true })
