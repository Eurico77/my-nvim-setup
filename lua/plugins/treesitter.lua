-- Configuração do Plugin 'nvim-treesitter'
-- Este plugin fornece um parser de sintaxe incremental para o Neovim, melhorando o realce de sintaxe,
-- indentação e navegação de código de forma mais precisa e eficiente.

return {
  -- Configuração do Plugin 'nvim-treesitter'
  -- Este plugin fornece um parser de sintaxe incremental para o Neovim, melhorando o realce de sintaxe,
  -- indentação e navegação de código de forma mais precisa e eficiente.
  {
    "nvim-treesitter/nvim-treesitter",
    -- Comando de build para atualizar os parsers do Treesitter.
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        -- Lista de parsers de linguagem a serem instalados.
        ensure_installed = {
          "lua", "vim", "vimdoc", -- Linguagens base do Neovim.
          "javascript", "typescript", "html", "css", "go", -- Linguagens web e Go.
          "prisma", -- Suporte para arquivos Prisma.
          -- Adicione outras linguagens aqui conforme necessário.
        },
        -- Não sincroniza a instalação dos parsers (instala em segundo plano).
        sync_install = false,
        -- Instala automaticamente parsers para linguagens não encontradas.
        auto_install = true,
        -- Configurações de realce de sintaxe.
        highlight = {
          enable = true, -- Habilita o realce de sintaxe do Treesitter.
          -- Outras opções como 'disable', 'additional_vim_regex_highlighting' podem ser configuradas aqui.
        },
        -- Outras configurações como indentação, textobjects, etc., podem ser adicionadas aqui.
      })
    end,
  }, -- Comma to separate from the next plugin

  -- Plugin oficial do Prisma
  -- Fornece suporte específico para arquivos Prisma, incluindo detecção de tipo de arquivo, indentação e realce.
  {
    "prisma/vim-prisma",
    -- Não requer configuração específica, apenas a presença do plugin.
  },
}