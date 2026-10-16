local code_window
return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        keys = {
            {
                "<leader>e",
                "<cmd>Neotree toggle<CR>",
                desc = "Toggle file explorer",
            },
            {
                "<leader>o",
                function()
                    if vim.bo.filetype == "neo-tree" then
                        if code_window and vim.api.nvim_win_is_valid(code_window)
                            and vim.api.nvim_win_get_tabpage(code_window) == vim.api.nvim_get_current_tabpage() then
                            vim.api.nvim_set_current_win(code_window)
                        else
                            vim.cmd("wincmd p")
                        end
                    else
                        code_window = vim.api.nvim_get_current_win()
                        vim.cmd("Neotree focus")
                    end
                end,
                desc = "Switch between code and file explorer",
            },
        },
    },
}

