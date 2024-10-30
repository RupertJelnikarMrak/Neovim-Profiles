local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set('n', '<leader>a', mark.add_file)
vim.keymap.set('n', '<C-g>', ui.toggle_quick_menu)

vim.keymap.set('n', '<C-h>', function() ui.nav_file(1) end, { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', function() ui.nav_file(2) end, { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', function() ui.nav_file(3) end, { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', function() ui.nav_file(4) end, { noremap = true, silent = true })
