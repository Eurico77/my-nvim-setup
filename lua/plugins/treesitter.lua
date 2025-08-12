return {
  -- Treesitter para syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        -- Lista de parsers a serem instalados
        ensure_installed = {
          "lua", "vim", "vimdoc",
          "javascript", "typescript", "html", "css", "go",
          "prisma", -- Adicionado para suporte ao Prisma
        },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true, -- Habilitar syntax highlighting
        },
      })
    end,
  },

  -- Plugin oficial do Prisma (para detecção de tipo de arquivo, indentação, etc.)
  {
    "prisma/vim-prisma",
  },
}
