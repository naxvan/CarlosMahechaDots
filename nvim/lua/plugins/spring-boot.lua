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
      root_dir = lspconfig.util.root_pattern("pom.xml", "build.gradle", ".git"),
    })

    -- Definir comandos para proyectos Maven
    local function maven_compile()
      local cmd = "mvn compile"
      vim.fn.system(cmd)
      vim.cmd('echo "Compilación completada"')
    end

    local function maven_run()
      local cmd = "mvn exec:java"
      vim.fn.system(cmd)
    end

    -- Definir comandos para proyectos Gradle
    local function gradle_build()
      local cmd = "gradle build"
      vim.fn.system(cmd)
      vim.cmd('echo "Build completado"')
    end

    local function gradle_run()
      local cmd = "gradle run"
      vim.fn.system(cmd)
    end

    -- Keymaps
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<Leader>mc", maven_compile, opts)
    vim.keymap.set("n", "<Leader>mr", maven_run, opts)
    vim.keymap.set("n", "<Leader>gb", gradle_build, opts)
    vim.keymap.set("n", "<Leader>gr", gradle_run, opts)

    -- Comandos de Neovim
    vim.api.nvim_create_user_command("MavenCompile", maven_compile, {})
    vim.api.nvim_create_user_command("MavenRun", maven_run, {})
    vim.api.nvim_create_user_command("GradleBuild", gradle_build, {})
    vim.api.nvim_create_user_command("GradleRun", gradle_run, {})
  end,
}
