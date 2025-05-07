return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
      "stevearc/conform.nvim",
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      }
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local servers = {
        astro = true,
        basedpyright = true,
        denols = {
          root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
        },
        gopls = true,
        lua_ls = true,
        rust_analyzer = true,
        sqlls = {
          root_dir = function()
            return vim.fn.getcwd()
          end
        },
        ts_ls = {
          root_dir = lspconfig.util.root_pattern("package.json"),
          single_file_support = false,
        },
      }

      for name, config in pairs(servers) do
        if config == true then
          config = {}
        end
        config = vim.tbl_deep_extend("force", {}, {
          capabilities = capabilities,
        }, config)

        lspconfig[name].setup(config)
      end

      require("conform").setup({
        lsp_fallback = true,
        formatters = {
          black = {
            prepend_args = { '--fast' },
          }
        },
        formatters_by_ft = {
          go = { "gofmt" },
          javascript = { "prettierd", "prettier" },
          javascriptreact = { "prettierd", "prettier" },
          lua = { "stylua" },
          python = { "isort", "black" },
          rust = { "rustfmt" },
          typescript = { "prettierd", "prettier" },
          typescriptreact = { "prettierd", "prettier" },
          ["_"] = { "trim_whitespace" },
        },
        default_format_opts = {
          lsp_format = "fallback",
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        }
      })

      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("custom-conform", { clear = true }),
        callback = function(args)
          require("conform").format({
            bufnr = args.buf,
            lsp_fallback = true,
            quiet = true,
          })
        end
      })
    end
  }
}
