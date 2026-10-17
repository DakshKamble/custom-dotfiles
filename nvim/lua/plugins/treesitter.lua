
return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",

        config = function()
            require("nvim-treesitter").setup()

            -- Install parsers for these languages
            require("nvim-treesitter").install({
                "lua",
                "vim",
                "vimdoc",
                "regex",
                "markdown",
                "markdown_inline",
                "python",
                "javascript",
                "typescript",
                "tsx",
                "html",
                "css",
                "json",
                "bash",
                "c",
                "cpp",
                "rust",
            })

            -- Enable syntax highlighting
            vim.api.nvim_create_autocmd("FileType", {
                group = vim.api.nvim_create_augroup("TreesitterHighlight", { clear = true }),
                callback = function(event)
                    pcall(vim.treesitter.start, event.buf)
                end,
            })
        end,
    },
}

