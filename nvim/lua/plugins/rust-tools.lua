local on_attach = require("plugins.lsp.handlers").on_attach
local capabilities = require("plugins.lsp.handlers").capabilities

return {
	{
		"simrat39/rust-tools.nvim",
		dependencies = { "neovim/nvim-lspconfig", "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" },
		config = function()
			require("rust-tools").setup({
				server = {
					on_attach,
					capabilities,
				},
			})
		end,
	},
}
