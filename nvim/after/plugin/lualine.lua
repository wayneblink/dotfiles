local ok, _ = pcall(require, "lualine")

if not ok then
    return
end

require("lualine").setup({
    options = {
        icons_enabled = false,
        theme = "tokyonight",
        component_separators = "|",
        section_separators = '',
    },
})
