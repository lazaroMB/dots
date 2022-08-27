require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    ensure_installed = { "golangci_lint_ls", "gopls" }
})

require("lsp_lines").setup()
require'lspconfig'.gopls.setup{}
