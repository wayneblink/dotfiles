local ok, telescope = pcall(require, "telescope")
if not ok then
    return
end

local nnoremap = require("wayneblink.keymap").nnoremap
telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<C-u>"] = false,
                ["<C-d>"] = false,
            },
        },
        file_ignore_patterns = {
            "node_modules",
        },
    },
})
require("telescope").load_extension("fzf")

vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader>b", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
    require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
        previewer = false,
    }))
end, { desc = "[/] Fuzzily search in current buffer" })

nnoremap("<C-p>", function()
    require('telescope.builtin').find_files(require('telescope.themes').get_dropdown())
end)

nnoremap("<leader>fg", function()
    require('telescope.builtin').git_files()
end)

nnoremap("<leader>fg", function()
    require('telescope.builtin').live_grep()
end)

nnoremap("<leader>fh", function()
    require('telescope.builtin').help_tags()
end)
