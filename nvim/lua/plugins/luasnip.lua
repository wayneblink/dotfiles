return {
  "L3MON4D3/LuaSnip",
  dependencies = "mlaursen/vim-react-snippets",
  keys = {
    {
      "<C-r>s",
      function()
        require("luasnip.extras.otf").on_the_fly("s")
      end,
      desc = "Insert on-the-fly snippet",
      mode = "i",
    },
  },
  opts = function()
    local types = require("luasnip.util.types")
    return {
      delete_check_events = "TextChanged",
      ext_opts = {
        [types.insertNode] = {
          unvisited = {
            virt_text = { { "|", "Conceal" } },
            virt_text_pos = "inline",
          },
        },
        [types.exitNode] = {
          unvisited = {
            virt_text = { { "|", "Conceal" } },
            virt_text_pos = "inline",
          },
        },
        [types.choiceNode] = {
          active = {
            virt_text = { { "(snippet) choice node", "LspInlayHint" } },
          },
        },
      },
    }
  end,
  config = function(_, opts)
    local ls = require("luasnip")
    ls.setup(opts)

    -- Load my custom snippets:
    require("luasnip.loaders.from_vscode").lazy_load({
      paths = vim.fn.stdpath("config") .. "/snippets",
    })
    require("vim-react-snippets").lazy_load()
  end,
}
