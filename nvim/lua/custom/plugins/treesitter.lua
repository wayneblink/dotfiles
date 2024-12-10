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
        disable = function(lang, buf)
          local max_filesize = 100 * 1024
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
        additional_vim_regex_highlighting = { "markdown" },
      },
      autopairs = {
        enable = true,
      },
      indent = { enable = true },
    }
  end,
}
