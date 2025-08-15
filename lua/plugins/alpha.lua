-- Configuração do Plugin 'alpha-nvim'
-- Este plugin cria uma tela de boas-vindas personalizável ao iniciar o Neovim.

return {
  "goolord/alpha-nvim",
  -- Garante que o plugin seja carregado no início do Neovim.
  lazy = false,
  -- Define a prioridade de carregamento.
  priority = 1000,
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Define os botões e suas ações na tela de boas-vindas.
    dashboard.section.buttons.val = {
      -- Botão para criar um novo arquivo.
      dashboard.button("e", "  Novo arquivo", ":ene <CR>"),
      -- Botão para procurar arquivos usando Telescope.
      dashboard.button("f", "  Procurar arquivos", ":Telescope find_files <CR>"),
      -- Botão para procurar texto em arquivos usando Telescope.
      dashboard.button("t", "  Procurar texto", ":Telescope live_grep <CR>"),
      -- Botão para listar arquivos recentes usando Telescope.
      dashboard.button("r", "  Arquivos recentes", ":Telescope oldfiles <CR>"),
      -- Botão para sair do Neovim.
      dashboard.button("q", "  Sair", ":qa<CR>"),
    }

    -- Configura e exibe a tela de boas-vindas com as opções definidas.
    alpha.setup(dashboard.opts)
  end,
}
