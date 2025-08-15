-- Configuração do Plugin 'nvim-cmp'
-- Este plugin é um motor de autocompletar modular para o Neovim, que integra sugestões de várias fontes.

return {
  "hrsh7th/nvim-cmp",
  -- Dependências do nvim-cmp, que fornecem as fontes de sugestões e funcionalidades adicionais.
  dependencies = {
    "L3MON4D3/LuaSnip", -- Motor de snippets.
    "saadparwaiz1/cmp_luasnip", -- Integração do nvim-cmp com o LuaSnip.
    "hrsh7th/cmp-nvim-lsp", -- Fonte de sugestões do LSP.
    "hrsh7th/cmp-path", -- Fonte de sugestões de caminhos de arquivo.
    "hrsh7th/cmp-buffer", -- Fonte de sugestões do buffer atual.
    "rafamadriz/friendly-snippets", -- Coleção de snippets populares.
    "onsails/lspkind.nvim", -- Adiciona ícones bonitos às sugestões de autocompletar.
  },
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      -- Configuração de snippets.
      snippet = {
        -- Função para expandir snippets usando LuaSnip.
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      -- Mapeamentos de tecla para navegar e confirmar sugestões.
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(), -- Seleciona o próximo item na lista de sugestões.
        ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- Seleciona o item anterior na lista de sugestões.
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirma a sugestão selecionada.
      }),
      -- Fontes de sugestões que o nvim-cmp deve usar.
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- Sugestões do Language Server Protocol.
        { name = "luasnip" }, -- Sugestões de snippets.
        { name = "buffer" }, -- Sugestões de palavras do buffer atual.
        { name = "path" }, -- Sugestões de caminhos de arquivo.
      }),
      -- Formatação das sugestões, adicionando ícones para melhor visualização.
      formatting = {
        format = require("lspkind").cmp_format({
          mode = "symbol_text", -- Exibe o símbolo e o texto.
          preset = "codicons" -- Usa o preset de ícones 'codicons'.
        })
      }
    })
  end
}
