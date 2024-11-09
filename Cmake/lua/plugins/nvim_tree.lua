require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
    },
    renderer = {
        group_empty = false,
    },
    filters = {
        dotfiles = true,
    },
})

local api = require("nvim-tree.api")

local function opts(desc)
    return { desc = "nvim-tree: " .. desc, noremap = true, silent = true, nowait = true }
end

vim.keymap.set('n', '<leader>pv', api.tree.open, opts("open"))
vim.keymap.set('n', '<leader>vp', api.tree.close, opts("close"))
