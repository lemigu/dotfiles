require("nvim-treesitter.configs").setup {
    ensure_installed = { "lua", "vim", "vimdoc", "go", "python", "markdown", "markdown_inline" },

    highlight = {
        enable = true,
        use_languagetree = true,
    },
    indent = { enable = true },
}
