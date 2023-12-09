return {
  "mhartington/formatter.nvim",
  event = "VeryLazy",
  opts = function()
    require("formatter").setup({
      filetype = {
        javascript = {
          require("formatter.filetypes.javascript").prettier,
        },
        typescript = {
          require("formatter.filetypes.typescript").prettier,
        },
        lua = {
          require("formatter.filetypes.lua").sylua,
        },
        python = {
          require("formatter.filetypes.python").autopep8,
        },
        ["*"] = {
          require("formatter.filetypes.any").remove_trailing_whitespace,
        },
      },
    })

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      command = "FormatWriteLock",
    })
  end,
}
