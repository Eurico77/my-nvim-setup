return {{
    "williamboman/mason.nvim",
    config = function()
        require("mason").setup({})
    end
}, {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {"williamboman/mason.nvim", "neovim/nvim-lspconfig"},
    config = function()
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        -- LISTA CORRIGIDA: Nomes de servidores LSP (não nomes de pacotes Mason)
        local servers_to_install = {"html", -- Servidor LSP para HTML
        "cssls", -- Servidor LSP para CSS
        "tailwindcss", -- Servidor LSP para Tailwind
        "eslint", -- Servidor LSP para ESLint
        "emmet_ls", -- Servidor LSP para Emmet
        "gopls", -- Servidor LSP para Go
        "prismals", -- Servidor LSP para Prisma
        "lua_ls" -- Servidor LSP para Lua
        }

        local on_attach = function(client, bufnr)
            if client.server_capabilities.documentSymbolProvider then
                require("nvim-navic").attach(client, bufnr)
            end

            vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

            local bufopts = {
                noremap = true,
                silent = true,
                buffer = bufnr
            }
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
            vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
            vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
            vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
            vim.keymap.set("n", "<leader>wl", function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, bufopts)
            vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
            vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, bufopts)
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)
        end

        local capabilities = cmp_nvim_lsp.default_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true

        local opts = {
            on_attach = on_attach,
            capabilities = capabilities
        }

        -- Configuração para TypeScript (ts_ls explicitamente)
        opts.root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json")
        opts.settings = {
            typescript = {
                inlayHints = {
                    includeInlayParameterNameHints = "all",
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true
                }
            },
            javascript = {
                inlayHints = {
                    includeInlayParameterNameHints = "all",
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true
                }
            }
        }

        lspconfig.ts_ls.setup(opts) -- Explicit setup for ts_ls

        mason_lspconfig.setup({
            ensure_installed = servers_to_install,
            handlers = {function(server_name)

                -- Configuração para ESLint
                if server_name == "eslint" then
                    opts.settings = {
                        codeActionOnSave = {
                            enable = true,
                            mode = "all"
                        },
                        format = true
                    }
                end

                -- Configuração para TailwindCSS
                if server_name == "tailwindcss" then
                    opts.filetypes = {"html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact",
                                      "svelte", "vue"}
                    opts.root_dir = lspconfig.util.root_pattern("tailwind.config.js", "tailwind.config.cjs",
                        "tailwind.config.mjs", "tailwind.config.ts")
                end

                -- Configuração para Emmet
                if server_name == "emmet_ls" then
                    opts.filetypes =
                        {"html", "css", "javascriptreact", "typescriptreact", "svelte", "vue", "htmldjango"}
                end

                -- Configuração para Lua
                if server_name == "lua_ls" then
                    opts.settings = {
                        Lua = {
                            runtime = {
                                version = "LuaJIT"
                            },
                            diagnostics = {
                                globals = {"vim"}
                            },
                            workspace = {
                                checkThirdParty = false
                            },
                            telemetry = {
                                enable = false
                            }
                        }
                    }
                end

                -- Configuração padrão para outros servidores
                lspconfig[server_name].setup(opts)
            end}
        })
    end
}, {
    "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup({
            toggler = {
                line = "<C-/>"
            }
        })
    end
}, {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                javascript = {"prettierd"},
                typescript = {"prettierd"},
                javascriptreact = {"prettierd"},
                typescriptreact = {"prettierd"},
                html = {"prettierd"},
                css = {"prettierd"},
                json = {"prettierd"},
                lua = {"stylua"},
                markdown = {"prettierd"}
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true
            }
        })
    end
}, {
    "mfussenegger/nvim-lint",
    config = function()
        require("lint").linters_by_ft = {
            javascript = {"eslint_d"},
            typescript = {"eslint_d"},
            javascriptreact = {"eslint_d"},
            typescriptreact = {"eslint_d"}
        }

        vim.api.nvim_create_autocmd({"BufWritePost"}, {
            callback = function()
                require("lint").try_lint()
            end
        })
    end
}}
