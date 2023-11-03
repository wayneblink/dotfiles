return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "LspInfo", "LspInstall", "LspUninstall" },
	config = function()
		require("plugins.lsp.handlers").setup()
	end,
	dependencies = {
		{
			"folke/neodev.nvim",
			event = "LspAttach",
			config = function()
				require("neodev").setup({
					library = {
						enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
						-- these settings will be used for your Neovim config directory
						runtime = true, -- runtime path
						types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
						plugins = true, -- installed opt or start plugins in packpath
						-- you can also specify the list of plugins to make available as a workspace library
						-- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
					},
					setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files
					-- With lspconfig, Neodev will automatically setup your lua-language-server
					-- If you disable this, then you have to set {before_init=require("neodev.lsp").before_init}
					-- in your lsp start options
					lspconfig = false,
					-- much faster, but needs a recent built of lua-language-server
					-- needs lua-language-server >= 3.6.0
					pathStrict = true,
				})
			end,
		},
		{
			"simrat39/rust-tools.nvim",
		},
		{
			"williamboman/mason.nvim",
			cmd = {
				"Mason",
				"MasonInstall",
				"MasonUninstall",
				"MasonUninstallAll",
				"MasonLog",
			}, -- Package Manager
			dependencies = "williamboman/mason-lspconfig.nvim",
			config = function()
				local mason = require("mason")
				local mason_lspconfig = require("mason-lspconfig")
				local lspconfig = require("lspconfig")

				local util = require("lspconfig.util")

				require("lspconfig.ui.windows").default_options.border = "rounded"

				local auto_install = {
					"tsserver",
					"eslint",
					"jsonls",
					"rust_analyzer",
					"gopls",
					"lua_ls",
					"clangd",
					"pyright",
					"intelephense",
					"cssls",
					"html",
					"jdtls",
					"yamlls",
					"vimls",
				}

				mason.setup({
					ui = {
						-- Whether to automatically check for new versions when opening the :Mason window.
						check_outdated_packages_on_open = false,
						border = "rounded",
						icons = {
							package_pending = " ",
							package_installed = " ",
							package_uninstalled = " ",
						},
					},
				})

				mason_lspconfig.setup({
					ensure_installed = auto_install,
				})

				local disabled_servers = {}

				mason_lspconfig.setup_handlers({
					function(server_name)
						for _, name in pairs(disabled_servers) do
							if name == server_name then
								return
							end
						end
						local opts = {
							on_attach = require("plugins.lsp.handlers").on_attach,
							capabilities = require("plugins.lsp.handlers").capabilities,
						}

						local require_ok, server = pcall(require, "plugins.lsp.settings." .. server_name)
						if require_ok then
							opts = vim.tbl_deep_extend("force", server, opts)
						end

						lspconfig[server_name].setup(opts)
						lspconfig["gopls"].setup({
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
						})
						lspconfig["rust_analyzer"].setup({
							rust_analyzer = function(_, opts)
								require("rust-tools").setup({ server = opts })
								return true
							end,
						})
					end,
				})
			end,
		},
	},
}
