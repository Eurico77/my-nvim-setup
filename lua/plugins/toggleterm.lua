-- Configuração do Plugin 'toggleterm.nvim'
-- Este plugin oferece um terminal integrado e facilmente acessível no Neovim.

return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      -- Mapeamento de tecla para abrir/fechar o terminal.
      -- Por padrão, usa a tecla Leader + 't'.
      open_mapping = [[<leader>t]],
      -- Direção de abertura do terminal ('horizontal', 'vertical', 'float').
      direction = "horizontal",
      -- Fecha o terminal automaticamente ao sair do shell.
      close_on_exit = true,
      -- Outras opções podem ser adicionadas aqui, como tamanho, tipo de terminal, etc.
    })
  end,
}
