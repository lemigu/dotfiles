local nvlsp = require "nvchad.configs.lspconfig"
local lspconfig = require "lspconfig"

nvlsp.defaults()

lspconfig.gopls.setup {
    on_attach = nvlsp.on_attach,
    capabilities = nvlsp.capabilities,
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
                unusedparams = true,
            },
        },
    },
}

lspconfig.pylsp.setup {
    on_attach = nvlsp.on_attach,
    capabilities = nvlsp.capabilities,
    cmd = { "pylsp" },
    filetypes = { "python", "py" },
    root_dir = lspconfig.util.root_pattern("pyproject.toml", ".git"),
    pycodestyle = {
        ignore = { "E501", "E231" },
    },
}
