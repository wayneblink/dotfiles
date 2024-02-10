return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    requires = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local util = require("lspconfig.util")
      local mason_lspconfig = require("mason-lspconfig")
      local disabled_servers = {}
      local on_attach = require("plugins.lsp.handlers").on_attach
      local capabilities = require("plugins.lsp.handlers").capabilities

      mason_lspconfig.setup_handlers({
        function(server_name)
          for _, name in pairs(disabled_servers) do
            if name == server_name then
              return
            end
          end
          local opts = {
            on_attach,
            capabilities,
          }

          local require_ok, server = pcall(require, "plugins.lsp.settings." .. server_name)
          if require_ok then
            opts = vim.tbl_deep_extend("force", server, opts)
          end

          lspconfig[server_name].setup(opts)
          lspconfig["gopls"].setup({
            on_attach,
            capabilities,
            cmd = { "gopls" },
            filetypes = { "go", "gomod", "gowork", "gotmpl" },
            root_dir = function(fname)
              -- see: https://github.com/neovim/nvim-lspconfig/issues/804
              local mod_cache = vim.trim(vim.fn.system("go env GOMODCACHE"))
              if fname:sub(1, #mod_cache) == mod_cache then
                local clients = vim.lsp.get_active_clients({ name = "gopls" })
                if #clients > 0 then
                  return clients[#clients].config.root_dir
                end
              end
              return util.root_pattern("go.work")(fname) or util.root_pattern("go.mod", ".git")(fname)
            end,
            settings = {
              gopls = {
                completeUnimported = true,
                usePlaceholders = true,
                analyses = {
                  unusedparams = true,
                }
              }
            }
          })
          local function organize_imports()
            local params = {
              command = "_typescript.organizeImports",
              arguments = { vim.api.nvim_buf_get_name(0) },
            }
            vim.lsp.buf.execute_command(params)
          end
          lspconfig["tsserver"].setup({
            preferences = {
              disableSuggestions = true,
            },
            commands = {
              OrganizeImports = {
                organize_imports,
                description = "Organize Imports",
              }
            }
          })
        end,
      })

      require("mason-lspconfig").setup({
        ensure_installed = {
          "tsserver",
          "rust_analyzer",
          "gopls",
          "lua_ls",
          "pyright",
          "clangd",
          "intelephense",
          "jdtls",
          "yamlls",
          "jsonls",
          "vimls",
          "cssls",
          "eslint",
          "gradle_ls",
        },
      })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    requires = {
      "williamboman/mason.nvim",
    },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "js-debug-adapter",
          "prettierd",
          "stylua",
        },
      })
    end,
  },
}
