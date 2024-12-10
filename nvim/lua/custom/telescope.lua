require("telescope").setup {
  defaults = require("telescope.themes").get_ivy {
    sorting_strategy = "ascending",
    layout_config = {
      height = 0.75,
    },
  },
  extensions = {
    wrap_results = true,
    fzf = {},
  },
}

pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "smart_history")
pcall(require("telescope").load_extension, "ui-select")

local builtin = require "telescope.builtin"

vim.keymap.set("n", "<space>fd", builtin.find_files)
vim.keymap.set("n", "<space>ft", builtin.git_files)
vim.keymap.set("n", "<space>fh", builtin.help_tags)
vim.keymap.set("n", "<space>fg", builtin.live_grep)
vim.keymap.set("n", "<space>/", builtin.current_buffer_fuzzy_find)
vim.keymap.set("n", "<space>s", builtin.spell_suggest)

vim.keymap.set("n", "<space>gw", builtin.grep_string)

vim.keymap.set("n", "<space>fa", function()
  ---@diagnostic disable-next-line: param-type-mismatch
  builtin.find_files { cwd = vim.fs.joinpath(vim.fn.stdpath "data", "lazy") }
end)

vim.keymap.set("n", "<space>en", function()
  builtin.find_files { cwd = vim.fn.stdpath "config" }
end)

vim.api.nvim_set_hl(0, "TelescopeNormal", { link = "Normal" })
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { link = "Normal" })
vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { link = "Normal" })
vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { link = "Normal" })
