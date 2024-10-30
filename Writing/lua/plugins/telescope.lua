local builtin = require('telescope.builtin')
local opts = { noremap = true, silent = true, nowait = true }

vim.keymap.set('n', '<leader>f', builtin.find_files, opts)
vim.keymap.set('n', '<C-p>', builtin.git_files, opts)
vim.keymap.set('n', '<leader>ps', function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end, opts)
