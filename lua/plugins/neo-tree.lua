return {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    branch = "v3.x",
    dependencies = {"nvim-tree/nvim-web-devicons", -- Required for file icons
    "MunifTanjim/nui.nvim" -- Required for UI components
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    hide_hidden = false,
                    hide_git_ignored = true,
                    hide_by_name = {"node_modules", ".DS_Store", ".git"}
                }
            },
            window = {
                width = 40,
                position = "left"
                -- win_options = {
                --     winfixwidth = true,
                --     winfixheight = true
                -- }
            },
            default_component_configs = {
                icon = {
                    folder_closed = ">",
                    folder_open = "v",
                    folder_empty = ">",
                    default = " ", -- ícone padrão para arquivos
                    highlight = "NeoTreeFileIcon",
                    padding = " ",
                    symlink_arrow = " ➛ ",
                    git_status = {
                        added = "✚", -- arquivo adicionado
                        modified = "", -- arquivo modificado
                        deleted = "✖", -- arquivo deletado
                        renamed = "", -- arquivo renomeado
                        untracked = "" -- arquivo não rastreado
                    }

                },
                name = {
                    highlight_opened_files = true
                }
            },
            keymaps = {
                ["<CR>"] = "open",
                ["<Tab>"] = "open"
            }
        })

        local devicons = require("nvim-web-devicons")
        devicons.set_icon({
            ts = {
                icon = "󰛦",
                color = "#3178c6",
                name = "TypeScript"
            },
            js = {
                icon = "󰌞",
                color = "#f7df1e",
                name = "JavaScript"
            },
            json = {
                icon = "",
                color = "#cbcb41",
                name = "Json"
            },
            md = {
                icon = "",
                color = "#519aba",
                name = "Markdown"
            },
            yml = {
                icon = "",
                color = "#a074c4",
                name = "Yaml"
            },
            yaml = {
                icon = "",
                color = "#a074c4",
                name = "Yaml"
            },
            Dockerfile = {
                icon = "",
                color = "#2496ed",
                name = "Dockerfile"
            },
            ["docker-compose.yml"] = {
                icon = "",
                color = "#2496ed",
                name = "DockerCompose"
            },
            lock = {
                icon = "",
                color = "#c678dd",
                name = "Lock"
            },
            gitignore = {
                icon = "",
                color = "#f1502f",
                name = "GitIgnore"
            },
            env = {
                icon = "",
                color = "#98c379",
                name = "Env"
            }
        })

    end
}
