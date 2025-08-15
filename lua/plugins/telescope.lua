-- Configuração do Plugin 'telescope.nvim'
-- Este plugin é uma ferramenta de busca e fuzzy-finding altamente extensível para o Neovim.

return {
  "nvim-telescope/telescope.nvim",
  -- Dependência essencial para funcionalidades assíncronas e utilitários.
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({
      -- Configurações padrão para todas as chamadas do Telescope.
      defaults = {
        -- Mapeamentos de tecla específicos para o modo de inserção do Telescope.
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next", -- Move para a próxima seleção.
            ["<C-k>"] = "move_selection_previous", -- Move para a seleção anterior.
          },
        },
      }
      -- Outras configurações globais podem ser adicionadas aqui, como temas, previewers, etc.
    })
  end
}
