vim.api.nvim_create_user_command("MasonInstallAll", function()
    vim.cmd "MasonInstall lua-language-server stylua gopls goimports terraform-ls markdown-oxide"
end, {})

vim.api.nvim_create_user_command("GoTest", function()
    if not os.getenv "TMUX" then
        vim.notify("Not running inside tmux!", vim.log.levels.WARN)
    end

    local cwd = vim.fn.expand "%:p:h"
    local test_cmd = "go test ./..."

    local tmux_cmd = string.format("tmux split-window -v -c %q '%s; read'", cwd, test_cmd)
    vim.fn.system(tmux_cmd)
end, {})
