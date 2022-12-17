--vim.g.tokyonight_style = "night"
--vim.g.tokyonight_italic_functions = true
--vim.g.tokyonight_transparent = true
--vim.g.tokyonight_transparent_sidebar = true

require("tokyonight").setup({
    style = "night"
})

vim.cmd [[colorscheme tokyonight-night]]
