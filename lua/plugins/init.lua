-- Configuração Principal de Plugins (Lazy.nvim)
-- Este arquivo é o ponto de entrada para o gerenciador de plugins Lazy.nvim.
-- Ele se encarrega de instalar e carregar todos os plugins definidos.

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Verifica se o Lazy.nvim está instalado. Se não estiver, clona o repositório.
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
                 lazypath})
end
-- Adiciona o caminho do Lazy.nvim ao 'runtimepath' do Neovim.
vim.opt.rtp:prepend(lazypath)

-- Configura o Lazy.nvim com a lista de plugins.
-- Cada plugin é definido como uma tabela, e pode ser importado de outros arquivos Lua.
require("lazy").setup({
  -- =============================================
  -- Interface do Usuário (UI)
  -- =============================================
  {
    import = "plugins.ui" -- Importa configurações de plugins de UI (temas, barras, ícones).
  },
  {
    import = "plugins.alpha" -- Importa a configuração da tela de boas-vindas (Alpha).
  },
  {
    import = "plugins.bufferline" -- Importa a configuração da barra de buffers.
  },

  -- =============================================
  -- Funcionalidades Essenciais
  -- =============================================
  {
    import = "plugins.lsp" -- Importa configurações de LSP (Language Server Protocol) e autocompletion.
  },
  -- Plugin para exibir breadcrumbs (caminho do código) no Neovim.
  {"SmiteshP/nvim-navic"},
  {
    import = "plugins.cmp" -- Importa a configuração do motor de autocompletar (nvim-cmp).
  },
  {
    import = "plugins.telescope" -- Importa a configuração do plugin de busca (Telescope).
  },
  {
    import = "plugins.treesitter" -- Importa a configuração para realce de sintaxe avançado (Treesitter).
  },
  {
    import = "plugins.web" -- Importa configurações de plugins para desenvolvimento web.
  },

  -- =============================================
  -- Terminal e Navegação
  -- =============================================
  {
    import = "plugins.toggleterm" -- Importa a configuração do terminal integrado (Toggleterm).
  },
  {
    "christoomey/vim-tmux-navigator", -- Plugin para navegação entre painéis do Neovim e Tmux.
    -- Não requer configuração específica, apenas a presença do plugin.
  },
})