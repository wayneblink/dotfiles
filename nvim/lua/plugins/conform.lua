return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    require("conform").setup({
      lsp_fallback = true,
      formatters = {
        black = {
          prepend_args = { "--fast" },
        },
      },
      formatters_by_ft = {
        fennel = { "fnlfmt" },
        go = { "gofmt" },
        javascript = { "prettierd", "prettier" },
        javascriptreact = { "prettierd", "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
        rust = { "rustfmt" },
        typescript = { "prettierd", "prettier" },
        typescriptreact = { "prettierd", "prettier" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    })
  end,
}
