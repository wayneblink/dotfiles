require("zen-mode").setup({
    window = {
        width = 90
    }
})

vim.keymap.set("n", "<leader>zz", function()
    require("zen-mode").toggle()
    vim.wo.wrap = false
    vim.wo.number = true
    vim.wo.relativenumber = true
    CallTheme()
end)
