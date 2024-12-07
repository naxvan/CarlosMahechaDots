return {
  "nvim-java/nvim-java",
  dependencies = {
    "nvim-java/nvim-java-core",
    "nvim-java/nvim-java-test",
    "nvim-java/nvim-java-dap",
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
  },
  config = function()
    require("java").setup()

    local lspconfig = require("lspconfig")
    lspconfig.jdtls.setup({
      -- You can add specific configuration options here
      -- For example:
      -- root_dir = lspconfig.util.root_pattern("pom.xml", "gradle.build", ".git"),
      -- on_attach = function(client, bufnr)
      --   -- Custom on_attach logic if needed
      -- end,
    })
  end,
}
