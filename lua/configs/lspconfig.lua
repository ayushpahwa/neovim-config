local nvlsp = require "nvchad.configs.lspconfig"
local lspconfig = require "lspconfig"

nvlsp.defaults()
local servers = { "html", "cssls", "ts_ls", "lua_ls", "eslint", "intelephense", "ruff", "pyright" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    settings = lsp == "intelephense" and {
      intelephense = {
        stubs = { "wordpress", "woocommerce", "wp-cli", "json", "pdo", "mysqli", "standard" },
      },
    } or nil,
  }
end

-- Explicitly configure Tailwind CSS to attach only to the correct filetypes
lspconfig["tailwindcss"].setup {
  filetypes = { "html", "css", "javascript", "typescript", "vue", "svelte", "astro" }, -- Excluded PHP
}
