local opts = { noremap = true, silent = true }

vim.keymap.set('i', 'jj', '<esc>', opts)

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", opts)
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", opts)

vim.keymap.set('n', 'J', "mzJ`z", opts)
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)
vim.keymap.set('n', 'n', "nzzzv", opts)
vim.keymap.set('n', "N", "Nzzzv", opts)

vim.keymap.set('x', '<leader>p', '"_dP', opts)

vim.keymap.set('n', '<leader>y', '"+y', opts)
vim.keymap.set('v', '<leader>y', '"+y', opts)
vim.keymap.set('n', '<leader>Y', '"+Y', opts)

vim.keymap.set('n', '<leader>d', '"_d', opts)
vim.keymap.set('v', '<leader>d', '"_d', opts)

vim.keymap.set('n', 'Q', '<nop>', opts)
vim.keymap.set('n', '<leader>pf', function() vim.lsp.buf.format() end, opts)

-- vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz', opts)
-- vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz', opts)
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz', opts)
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz', opts)

vim.keymap.set('n', '<leader>s', ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', opts)

vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

vim.keymap.set('n', '<leader>ln', function() vim.wo.relativenumber = not vim.wo.relativenumber end, opts)
