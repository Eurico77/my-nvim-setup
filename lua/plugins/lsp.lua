-- Configuração do Language Server Protocol (LSP)
-- Este arquivo gerencia os servidores de linguagem que fornecem funcionalidades como autocompletar,
-- ir para definição, refatoração, e diagnósticos (erros e avisos).

return {
  -- Gerenciador de LSPs (Mason)
  -- Facilita a instalação e gerenciamento de servidores de linguagem, formatadores e linters.
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({})
    end
  },

  -- Ponte entre Mason e LSPConfig (mason-lspconfig)
  -- Conecta o Mason com o nvim-lspconfig, permitindo que os LSPs instalados pelo Mason sejam configurados facilmente.
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      -- Lista de servidores de linguagem a serem instalados e configurados automaticamente pelo Mason.
      local servers_to_install = {
        "ts_ls", -- TypeScript/JavaScript Language Server
        "html", -- HTML Language Server
        "cssls", -- CSS Language Server
        "tailwindcss", -- Tailwind CSS Language Server
        "eslint", -- ESLint Language Server
        "emmet_ls", -- Emmet Language Server
        "gopls", -- Go Language Server
        "prismals", -- Prisma Language Server
        -- Adicione outros LSPs aqui conforme necessário.
      }

      -- Função a ser executada quando um LSP é anexado a um buffer.
      -- Configura mapeamentos de tecla específicos do LSP e outras funcionalidades.
      local on_attach = function(client, bufnr)
        -- Anexa o nvim-navic (breadcrumbs) ao cliente LSP, apenas se o servidor suportar documentSymbols.
        if client.server_capabilities.documentSymbolProvider then
          require("nvim-navic").attach(client, bufnr)
        end

        -- Habilita autocompletar com <c-x><c-o> (omnifunc).
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

        -- Mapeamentos de tecla específicos do LSP.
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts) -- Ir para a declaração.
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts) -- Ir para a definição.
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts) -- Exibir informações de hover.
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts) -- Ir para a implementação.
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts) -- Exibir ajuda de assinatura.
        vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts) -- Adicionar pasta ao workspace.
        vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts) -- Remover pasta do workspace.
        vim.keymap.set("n", "<leader>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts) -- Listar pastas do workspace.
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts) -- Ir para a definição de tipo.
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts) -- Renomear símbolo.
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts) -- Ações de código (refatoração, correção).
        vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts) -- Encontrar referências.
        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, bufopts) -- Abrir janela flutuante de diagnóstico.
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts) -- Ir para o diagnóstico anterior.
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts) -- Ir para o diagnóstico seguinte.
      end

      -- Capacidades que o cliente (Neovim) informa ao servidor de linguagem.
      -- Isso permite que o LSP saiba quais funcionalidades o Neovim suporta.
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Configura o mason-lspconfig para instalar e configurar os servidores.
      mason_lspconfig.setup({
        ensure_installed = servers_to_install, -- Garante que os servidores listados sejam instalados.
        handlers = {
          -- Handler padrão para configurar cada LSP.
          function(server_name)
            lspconfig[server_name].setup({
              on_attach = on_attach, -- Função a ser chamada ao anexar o LSP a um buffer.
              capabilities = capabilities, -- Capacidades do cliente.
              -- Configurações específicas para cada LSP podem ser adicionadas aqui.
              -- Ex: para gopls, adicionar settings = { gopls = { analyses = { unusedparams = true }, staticcheck = true } }
              -- Para ts_ls, adicionar settings = { javascript = { inlayHints = { includeInlayParameterNameHints = "all" } } }
            })
          end,
        },
      })

      -- Configurações específicas para LSPs que precisam de opções adicionais
      -- Exemplo para gopls (já estava em languages/go.lua)
      lspconfig.gopls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          gopls = {
            analyses = { unusedparams = true },
            staticcheck = true,
          },
        },
      })

      -- Exemplo para ts_ls (já estava em languages/web.lua)
      lspconfig.ts_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
        settings = {
          completions = { completeFunctionCalls = true },
          inlayHints = {
            includeInlayParameterNameHints = "all"
          }
        }
      })

      -- Exemplo para html (já estava em languages/web.lua)
      lspconfig.html.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "html", "javascriptreact", "typescriptreact" }
      })

      -- Exemplo para cssls (já estava em languages/web.lua)
      lspconfig.cssls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          css = { completion = { completePropertyWithSemicolon = true } }
        }
      })

      -- Exemplo para emmet_ls (já estava em languages/web.lua)
      lspconfig.emmet_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "html", "css", "javascriptreact", "typescriptreact" }
      })
    end
  },

  -- Plugin para comentar/descomentar linhas (Comment.nvim)
  -- Embora não seja um LSP, estava no seu arquivo lsp.lua original. Mantido aqui por enquanto.
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({
        toggler = {
          line = "<C-/>", -- Atalho para comentar/descomentar a linha atual.
        },
      })
    end
  },
}
