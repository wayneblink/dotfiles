return {
  {
    "saghen/blink.cmp",
    dependencies = "LuaSnip",
    version = "1.*",
    event = "InsertEnter",
    opts = {
      keymap = {
        preset = "default",
        ["<C-k>"] = { "snippet_forward", "fallback" },
        ["<C-j>"] = { "snippet_backward", "fallback" },
      },
      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "mono",
      },
      completion = {
        ghost_text = {
          enabled = true,
        },
        list = {
          selection = { preselect = false, auto_insert = true },
          max_items = 10,
        },
        documentation = {
          auto_show = true,
          window = {
            winblend = 15,
          },
        },
        menu = {
          winblend = 15,
        },
      },
      snippets = { preset = "luasnip" },
      signature = {
        enabled = true,
        window = {
          winblend = 15,
        },
      },
    },
  },
}
