return {
  -- Neotest core plugin
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      -- Specific adapter for Java
      "rcasia/neotest-java",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-java"),
        },
      })
    end,
  },
}
