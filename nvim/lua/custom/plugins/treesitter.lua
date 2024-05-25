return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require "nvim-treesitter.configs"

    configs.setup {
      sync_install = false,
      auto_install = true,
      ignore_install = {},
      modules = {},
      ensure_installed = {
        "rust",
        "javascript",
        "typescript",
        "jsdoc",
        "tsx",
        "json",
        "ron",
        "toml",
        "go",
        "vim",
        "lua",
        "c",
        "cpp",
        "java",
        "python",
        "markdown",
        "markdown_inline",
        "html",
        "css",
        "scss",
        "php",
        "regex",
        "bash",
        "query",
      }, -- one of "all" or a list of languages
      highlight = {
        enable = true, -- false will disable the whole extension
        additional_vim_regex_highlighting = { "markdown" },
      },
      autopairs = {
        enable = true,
      },
      indent = { enable = true },
    }
  end,
}
