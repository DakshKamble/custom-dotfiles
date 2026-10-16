
return {
    {
        'nvim-telescope/telescope.nvim',
        version = '*',
        opts = function()
            return {
                defaults = {
                    mappings = {
                        n = { q = require('telescope.actions').close },
                    },
                },
                extensions = {
                    ['ui-select'] = require('telescope.themes').get_dropdown({
                        winblend = 0,
                        previewer = false,
                        prompt_title = false,
                        border = true,
                    }),
                },
            }
        end,
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
            },
        },
        keys = {
            { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
            { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Live Grep' },
            { '<leader>fr', '<cmd>Telescope oldfiles<cr>', desc = 'Recent Files' },
            { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Find Buffers' },
        },
    },
}

