local nvlsp = require "nvchad.configs.lspconfig"
local lspconfig = require "lspconfig"

nvlsp.defaults()
local servers = { "html", "cssls", "ts_ls", "lua_ls", "tailwindcss", "eslint", "intelephense" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    settings = lsp == "intelephense" and {
      intelephense = {
        stubs = { "wordpress", "woocommerce", "wp-cli", "json", "pdo", "mysqli" },
      },
    } or nil,
  }
end
