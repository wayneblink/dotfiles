return {
  {
    "echasnovski/mini.indentscope",
    opts = {
      draw = {
        animation = require("mini.indentscope").gen_animation.none(),
      },
    },
    confige = function(_, opts)
      require("mini.indentscope").setup(opts)
    end,
  },
}
