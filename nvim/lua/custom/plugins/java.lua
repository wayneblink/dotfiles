return {
  "simaxme/java.nvim",
  ft = "java",
  dependencies = { "mfussenegger/nvim-jdtls" },
  config = function()
    require("simaxme-java").setup()
  end,
}
