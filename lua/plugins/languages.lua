return {
  -- Auto-fechamento e renomeação de tags HTML/JSX
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = true, -- Ativar auto-fechamento
          enable_rename = true, -- Ativar auto-renomeação
          enable_close_on_slash = true -- Fechar tag com "/"
        }
      })
    end
  },

  -- Adicionar pares de " ", " ' ", ` ` etc.
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end
  }
}