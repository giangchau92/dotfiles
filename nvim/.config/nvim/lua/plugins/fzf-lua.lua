return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    keys = {
        {
            "<leader>lf",
            function()
                require('fzf-lua').files()
            end,
            desc = "List [F]iles",
            noremap = true,
            silent = true,
        },
        {
            "<leader>lF",
            function()
                require('fzf-lua').files()
            end,
            desc = "List [F]iles",
            noremap = true,
            silent = true,
        },
        {
            "<leader><space>",
            function()
                require('fzf-lua').files()
            end,
            desc = "List [F]iles",
            noremap = true,
            silent = true,
        },
        {
            "<leader>/",
            function()
                require('fzf-lua').buffers()
            end,
            desc = "List [B]uffers",
            noremap = true,
            silent = true,
        },
        {
            "<leader>lb",
            function()
                require('fzf-lua').buffers()
            end,
            desc = "List [B]uffers",
            noremap = true,
            silent = true,
        },
        {
            "<leader>lr",
            function()
                require('fzf-lua').resume()
            end,
            desc = "[R]esume",
            noremap = true,
            silent = true,
        },
        {
            "<leader>lo",
            function()
                require('fzf-lua').oldfiles()
            end,
            desc = "List [O]ld files",
            noremap = true,
            silent = true,
        },
        {
            "<leader>lv",
            function()
                require('fzf-lua').files({ cwd = '~/.config' })
            end,
            desc = "List [V]im Config",
            noremap = true,
            silent = true,
        },
        {
            "<leader>sg",
            function()
                require('fzf-lua').grep()
            end,
            desc = "Search [G]rep",
            noremap = true,
            silent = true,
        },
        {
            "<leader>sw",
            function()
                require('fzf-lua').live_grep()
            end,
            desc = "[S]earch Live Grep",
            noremap = true,
            silent = true,
        },
        {
            "<leader>sr",
            function()
                require('fzf-lua').live_grep_resume()
            end,
            desc = "[R]esume Search Grep",
            noremap = true,
            silent = true,
        },
        {
            "<leader>sb",
            function()
                require('fzf-lua').grep_curbuf()
            end,
            desc = "[S]earch Current [B]uffer",
            noremap = true,
            silent = true,
        },
        {
            "<leader>sb",
            function()
                require('fzf-lua').grep_curbuf()
            end,
            desc = "Search Current [B]uffer",
            noremap = true,
            silent = true,
        },
        {
            "<leader>gd",
            function()
                require('fzf-lua').lsp_definitions()
            end,
            desc = "Go [D]efinition",
            noremap = true,
            silent = true,
        },
        {
            "<leader>gr",
            function()
                require('fzf-lua').lsp_references()
            end,
            desc = "Go [R]eferences",
            noremap = true,
            silent = true,
        },
        {
            "<leader>gi",
            function()
                require('fzf-lua').lsp_implementations()
            end,
            desc = "Go [I]mplementations",
            noremap = true,
            silent = true,
        },
        {
            "<leader>bs",
            function()
                vim.notify("Open document symbols", vim.log.levels.INFO)
                require('fzf-lua').lsp_document_symbols({
                    symbols = LazyVim.config.get_kind_filter(),
                    sorting_strategy = "ascending", -- Display symbols top-to-bottom as they appear in the file
                })
            end,
            desc = "Buffer [S]ymbols",
            noremap = true,
            silent = true,
        },
        {
            "<leader>ss",
            function()
                require('fzf-lua').lsp_live_workspace_symbols()
            end,
            desc = "Search Project [S]ymbols",
            noremap = true,
            silent = true,
        },
        {
            "<leader>lk",
            function()
                require('fzf-lua').keymaps()
            end,
            desc = "List [K]eymaps",
            noremap = true,
            silent = true,
        },
        {
            "<leader>ca",
            function()
                require('fzf-lua').lsp_code_actions()
            end,
            desc = "Code [A]ctions",
            noremap = true,
            silent = true,
        },
        {
            "<leader>bD",
            function()
                require('fzf-lua').diagnostics_document()
            end,
            desc = "Buffer [D]iagnostics",
            noremap = true,
            silent = true,
        },
        {
            "<leader>sd",
            function()
                require('fzf-lua').diagnostics_workspace()
            end,
            desc = "Search Project [D]iagnostics",
            noremap = true,
            silent = true,
        },
        {
            "<leader>lh",
            function()
                require('fzf-lua').search_history()
            end,
            desc = "List [H]istory",
            noremap = true,
            silent = true,
        },
        {
            "<leader>lc",
            function()
                require('fzf-lua').command_history()
            end,
            desc = "List [C]ommands Histories",
            noremap = true,
            silent = true,
        },
        {
            "<leader>lC",
            function()
                require('fzf-lua').keymaps()
            end,
            desc = "List [C]ommands",
            noremap = true,
            silent = true,
        },
    },
    opts = {
        winopts = {
            height = 0.9,
            width = 0.9,
            preview = { default = "bat" },
            on_create = function()
                -- called once upon creation of the fzf main window
                -- can be used to add custom fzf-lua mappings, e.g:
                vim.notify("Setup key for fzf", vim.log.levels.INFO)
            end,
        },
        files = {
            prompt = ' ❯ ',
            file_icons = false,
            multiprocess = true,
        },
        keymap = {
            fzf = {
                ["shift-left"]       = "first",
                ["shift-right"]       = "last",
            },
        },
    },
    config = function(_, opts)
        local newOpts = vim.tbl_deep_extend('keep', opts, {"fzf-native"});
        require("fzf-lua").setup(opts)
    end
}