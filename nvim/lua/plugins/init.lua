local statusline_opts = require "plugins.configs.statusline"

return {
    { lazy = true, "nvim-lua/plenary.nvim" },

    { "nvim-tree/nvim-web-devicons", opts = {} },

    {
        "echasnovski/mini.statusline",
        config = function()
            require("mini.statusline").setup(statusline_opts)
        end,
    },

    { "lewis6991/gitsigns.nvim", opts = {} },

    {
        "startup-nvim/startup.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
        },
        config = function()
            require("startup").setup()
        end,
    },

    { "nyoom-engineering/oxocarbon.nvim" },

    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        opts = {},
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require "plugins.configs.treesitter"
        end,
    },

    {
        "akinsho/bufferline.nvim",
        opts = require "plugins.configs.bufferline",
    },

    -- we use blink plugin only when in insert mode
    -- so lets lazyload it at InsertEnter event
    {
        "saghen/blink.cmp",
        version = "1.*",
        event = "InsertEnter",
        dependencies = {
            { "windwp/nvim-autopairs", opts = {} },
        },
        opts = function()
            return require "plugins.configs.blink"
        end,
    },

    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        cmd = { "Mason", "MasonInstall" },
        opts = {},
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
        end,
    },

    {
        "stevearc/conform.nvim",
        opts = require "plugins.configs.conform",
    },

    {
        "nvimdev/indentmini.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
    },

    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        opts = require "plugins.configs.telescope",
    },

    {
        "kdheepak/lazygit.nvim",
        lazy = true,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        keys = {
            { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
        },
    },
}
