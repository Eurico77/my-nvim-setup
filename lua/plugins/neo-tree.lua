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
                hijack_netrw_behavior = "open_current",
                filtered_items = {
                    hide_dotfiles = false,
                    hide_hidden = false,
                    hide_git_ignored = true,
                    hide_by_name = {"node_modules", ".DS_Store", ".git"}
                }
            },
            window = {
                width = 32,
                position = "left",
                win_options = {
                    winfixwidth = true,
                    winfixheight = true
                }
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

        vim.keymap.set("n", "<C-n>", function()
            local neo_tree_open = false
            for _, winid in ipairs(vim.api.nvim_list_wins()) do
                local bufnr = vim.api.nvim_win_get_buf(winid)
                if vim.api.nvim_buf_get_option(bufnr, "filetype") == "neo-tree" then
                    neo_tree_open = true
                    break
                end
            end

            if neo_tree_open then
                vim.cmd("Neotree close")
            else
                vim.cmd("Neotree show")
            end
        end, {
            desc = "Alternar Neo-tree"
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
