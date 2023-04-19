local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
    debug = false,
    sources = {
        formatting.prettier.with({
            filetypes = {
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
                "vue",
                "css",
                "scss",
                "less",
                "html",
                "json",
                "yaml",
                "markdown",
                "graphql",
                "solidity",
            }
        }),
        formatting.black.with({ extra_args = { "--fast" } }),
        formatting.stylua,
        formatting.gofmt,
        diagnostics.eslint,
    },
})
