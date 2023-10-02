return {
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        config = function()
            require("persistence").setup()
        end,
        keys = {
            {
                "<leader>ld",
                '<cmd>lua require("persistence").load()<cr>',
                desc = "Load Dir Session",
                silent = true,
            },
            {
                "<leader>ll",
                '<cmd>lua require("persistence").load({ last = true })<cr>',
                desc = "Load Last Session",
                silent = true,
            },
        },
    },
    {
        "lewis6991/impatient.nvim",
        config = function()
            require("impatient").enable_profile()
        end,
    },
    {
        "nathom/filetype.nvim",
        opts = {
            overrides = {
                extensions = {
                    v = "vlang",
                    proto = "proto",
                    puml = "plantuml",
                    esdl = "edgeql",
                    cql = "sql",
                },
            },
        },
    },
    "nvim-lua/plenary.nvim",
    {
        "antoinemadec/FixCursorHold.nvim",
        event = "BufRead",
        config = function()
            vim.g.cursorhold_updatetime = 100
        end,
    },
    {
        "williamboman/mason.nvim",
    },
    {
        "williamboman/mason-lspconfig.nvim",
    },
}
