return  {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {"nvim-lua/plenary.nvim",
                        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
                        "MunifTanjim/nui.nvim"
        },
        config = function()
                -- Initialize neo-tree
                require("neo-tree").setup({
                  close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
                  filesystem = {
                        follow_current_file = {
                                        enable = true
                                }, -- Automatically follow the current file
                        use_libuv_file_watcher = true, -- Automatically update the tree when files change
                  },
                  window = {
                    position = "left",
                    width = 30,
                  },
                })

                -- Toggle keymap
                vim.api.nvim_set_keymap('n', '<leader>n', ':Neotree toggle<CR>', { noremap = true, silent = true })
        end
}

