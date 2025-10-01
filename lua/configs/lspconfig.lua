-- Using new vim.lsp.config API (Neovim 0.11+)
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local servers = { "html", "cssls", "ts_ls", "gopls", "bashls", "dockerls", "terraformls" }

-- Default config for most servers
local default_config = {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- Setup LSP servers with default config
for _, server in ipairs(servers) do
  vim.lsp.config(server, default_config)
end

-- helm-ls with custom settings
vim.lsp.config('helm_ls', vim.tbl_extend('force', default_config, {
  settings = {
    ['helm-ls'] = {
      yamlls = {
        path = "yaml-language-server",
      }
    }
  }
}))

-- yamlls
vim.lsp.config('yamlls', default_config)
