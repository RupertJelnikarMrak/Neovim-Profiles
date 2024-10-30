require("nvim-surround").setup{
    keymaps = {
        insert = false,
        insert_line = false,
        normal = "ya",
        normal_cur = "yaa",
        normal_line = "yA",
        normal_cur_line = "yAA",
        visual = "ga",
        visual_line = "gA",
        delete = "da",
        change = "ca",
        change_line = "cA",
    },
}
