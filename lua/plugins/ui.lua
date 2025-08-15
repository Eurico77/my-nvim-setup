-- Configurações de Plugins de Interface do Usuário (UI)
-- Este arquivo agrupa plugins que aprimoram a experiência visual e interativa do Neovim.
return { -- Feedback do LSP (Language Server Protocol)
-- Exibe um pequeno ícone de progresso no canto inferior direito durante operações do LSP.
{
    "j-hui/fidget.nvim",
    config = function()
        require("fidget").setup({})
    end
}, -- Sinais do Git
-- Mostra indicadores na barra lateral para linhas adicionadas, modificadas ou removidas pelo Git.
{
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup({})
    end
}, -- Tema de Cores 'vesper.nvim'
-- Define o esquema de cores geral do Neovim.
{
    "datsfilipe/vesper.nvim",
    priority = 1000, -- Garante que o tema seja carregado antes de outros plugins que dependem dele.
    opts = {
        transparent = true -- Define o fundo como transparente.
    },
    config = function(_, opts)
        require("vesper").setup(opts)
        vim.cmd [[colorscheme vesper]] -- Aplica o esquema de cores.
    end
}, -- Indentação Colorida (Indent Blankline)
-- Adiciona linhas verticais para visualizar a indentação do código, facilitando a leitura.
{
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        require("ibl").setup({
            scope = {
                enabled = false -- Desabilita o escopo de indentação (opcional).
            }
        })
    end
}, -- Notificações (nvim-notify)
-- Substitui as notificações padrão do Neovim por um sistema mais visualmente agradável.
{
    "rcarriga/nvim-notify",
    config = function()
        require("notify").setup({})
        vim.notify = require("notify")
    end
}, -- Breadcrumbs Engine (barbecue.nvim e nvim-navic)
-- Exibe o caminho hierárquico do código (ex: namespace > class > function) na barra de status.
{
    "utilyre/barbecue.nvim",
    dependencies = {"SmiteshP/nvim-navic", "nvim-tree/nvim-web-devicons"},
    config = function()
        require("barbecue").setup({
            theme = {
                normal = {
                    bg = "NONE",
                    fg = vim.api.nvim_get_hl_by_name("Normal", true).foreground
                }
            } -- Define o tema para o barbecue.
        })
    end
}, -- Barra de Status (lualine.nvim)
-- Uma barra de status leve e extensível que exibe informações úteis sobre o arquivo atual, modo, etc.
{
    "nvim-lualine/lualine.nvim",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
        require("lualine").setup({
            options = {
                theme = "vesper", -- Usa o tema 'vesper' para a lualine.
                component_separators = {
                    left = "",
                    right = ""
                },
                section_separators = {
                    left = "",
                    right = ""
                },
                disabled_filetypes = {"NvimTree"}, -- Desabilita a lualine para o NvimTree.
                globalstatus = true -- Mostra a lualine em todas as janelas.
            },
            sections = {
                lualine_a = {"mode"}, -- Seção A: Modo atual (NORMAL, INSERT, etc.).
                lualine_b = {"branch"}, -- Seção B: Branch do Git.
                lualine_c = { -- Seção C: Nome do arquivo e status do Git.
                {
                    'filename',
                    path = 1, -- Mostra o caminho relativo do arquivo.
                    shorting_rule = 'truncate_from_right' -- Trunca o caminho se for muito longo.
                }, {
                    "diff", -- Mostra diferenças do Git (adicionado, modificado, removido).
                    symbols = {
                        added = " ",
                        modified = " ",
                        removed = " "
                    }
                }},
                lualine_x = { -- Seção X: Cliente LSP, diagnósticos, encoding e tipo de arquivo.
                'lsp_client', -- Nome do cliente LSP ativo.
                {
                    "diagnostics", -- Exibe diagnósticos (erros, warnings, info).
                    sources = {"nvim_diagnostic"},
                    symbols = {
                        error = " ",
                        warn = " ",
                        info = " ",
                        hint = " "
                    }
                }, "encoding", "filetype"},
                lualine_y = {"progress"}, -- Seção Y: Progresso do arquivo.
                lualine_z = {"location"} -- Seção Z: Localização no arquivo (linha:coluna).
            },
            extensions = {"nvim-tree"} -- Extensões para integração com outros plugins.
        })
    end
}, -- Explorador de Arquivos (NvimTree)
-- Um explorador de arquivos em árvore para navegação e gerenciamento de arquivos.
{
    "nvim-tree/nvim-tree.lua",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
        -- Desabilita os exploradores de arquivo padrão do Vim para usar o NvimTree.
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- Função auxiliar para obter o nome do projeto (diretório atual).
        local function get_project_name()
            return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
        end

        require("nvim-tree").setup({
            hijack_netrw = true, -- Assume o controle do netrw.
            view = {
                width = 35, -- Largura do explorador de arquivos.
                side = "left" -- Posição do explorador (esquerda).
            },
            renderer = {
                group_empty = false, -- Não agrupa diretórios vazios.
                root_folder_label = function()
                    return " " .. get_project_name() -- Rótulo da pasta raiz com ícone e nome do projeto.
                end,
                indent_markers = {
                    enable = true, -- Habilita marcadores de indentação.
                    icons = {
                        corner = "└ ",
                        edge = "│ ",
                        none = "  "
                    }
                },
                icons = {
                    glyphs = {
                        folder = {
                            arrow_closed = "", -- Ícone de pasta fechada.
                            arrow_open = "" -- Ícone de pasta aberta.
                        }
                    }
                },
                highlight_git = true -- Destaca arquivos com status Git.
            },
            update_focused_file = {
                enable = true, -- Atualiza o foco no explorador quando o arquivo é alterado.
                update_root = true -- Atualiza a raiz do explorador.
            },
            diagnostics = {
                enable = true, -- Habilita a exibição de diagnósticos.
                show_on_dirs = true, -- Mostra diagnósticos em diretórios.
                icons = {
                    hint = "",
                    info = "",
                    warning = "",
                    error = ""
                }
            }
        })
        -- Mapeamento de tecla para focar/alternar o explorador de arquivos.
        vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<cr>", {
            desc = "Focar/Alternar Explorador de Arquivos"
        })
    end
}}
