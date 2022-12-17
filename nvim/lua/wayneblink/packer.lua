vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)

    use("wbthomason/packer.nvim")

    use({
      "VonHeikemen/lsp-zero.nvim",
      requires = {
        -- LSP Support
        {"neovim/nvim-lspconfig"},
        {"williamboman/mason.nvim"},
        {"williamboman/mason-lspconfig.nvim"},

        -- Autocompletion
        {"hrsh7th/nvim-cmp"},
        {"hrsh7th/cmp-buffer"},
        {"hrsh7th/cmp-path"},
        {"saadparwaiz1/cmp_luasnip"},
        {"hrsh7th/cmp-nvim-lsp"},
        {"hrsh7th/cmp-nvim-lua"},

        -- Snippets
        {"L3MON4D3/LuaSnip"},
        {"rafamadriz/friendly-snippets"},

        -- Status updates for LSP
        {"j-hui/fidget.nvim"},
      }
    })

    use({ -- Highlight, edit, and navigate code
        "nvim-treesitter/nvim-treesitter",
        run = function()
            pcall(require("nvim-treesitter.install").update({ with_sync = true }))
        end,
    })

    use({ -- Additional text objects via treesitter
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
    })

    -- Git related plugins
    use("tpope/vim-fugitive")
    use("tpope/vim-rhubarb")
    use("lewis6991/gitsigns.nvim")

    use("lukas-reineke/indent-blankline.nvim")
    use("numToStr/Comment.nvim")
    use("tpope/vim-sleuth")
    use("theprimeagen/harpoon")

    use("nvim-lua/plenary.nvim")
    use({"nvim-telescope/telescope.nvim", tag = "0.1.x",
        requires = { {"nvim-lua/plenary.nvim"} }
    })
    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make"
    })

    use("folke/tokyonight.nvim")

    use("mbbill/undotree")
    use("folke/zen-mode.nvim")
    use({"nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    })

    use("neovim/nvim-lspconfig")
    use("jose-elias-alvarez/null-ls.nvim")
    use({
        "prettier/vim-prettier",
        run = "yarn install",
        ft = {"javascript", "typescript", "css", "less", "scss", "graphql", "markdown", "vue", "html" }
    })

    local has_plugins, plugins = pcall(require, "custom.plugins")
    if has_plugins then
        plugins(use)
    end
end)
