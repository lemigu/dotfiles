vim.api.nvim_create_user_command("MasonInstallAll", function()
    vim.cmd "MasonInstall lua-language-server stylua gopls terraform-ls"
end, {})
