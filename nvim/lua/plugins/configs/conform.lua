vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        require("conform").format { bufnr = args.buf }
    end,
})

return {
    formatters_by_ft = {
        lua = { "stylua" },
        go = { "gofmt", "goimports" },
        terraform = { "terraform_fmt" },
        tf = { "terraform_fmt" },
    },
}
