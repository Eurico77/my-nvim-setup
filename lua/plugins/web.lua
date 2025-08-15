-- Configurações de Plugins para Desenvolvimento Web
-- Este arquivo agrupa plugins úteis para o desenvolvimento web, como autocompletar tags HTML/JSX, 
-- auto-fechamento de pares e um servidor de desenvolvimento.

return {
  -- Plugin para auto-fechamento e renomeação de tags HTML/JSX
  -- Útil para manter a consistência e agilidade ao trabalhar com marcação.
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({
        -- Tipos de arquivo onde o autotag deve ser ativado.
        filetypes = {
          "html", "javascript", "typescript",
          "javascriptreact", "typescriptreact",
          "svelte", "vue", "tsx", "jsx", "rescript",
          "xml", "php", "markdown"
        },
        -- Tags que devem ser ignoradas pelo auto-fechamento (geralmente tags self-closing).
        skip_tags = {
          "area", "base", "br", "col", "command", "embed",
          "hr", "img", "slot", "input", "keygen", "link",
          "meta", "param", "source", "track", "wbr"
        },
        -- Novas opções aninhadas sob 'opts' para compatibilidade futura.
        opts = {
          -- Ativar auto-fechamento de tags.
          enable_close = true,
          -- Ativar auto-renomeação de tags (ao renomear a tag de abertura, a de fechamento também muda).
          enable_rename = true,
          -- Fechar tag automaticamente ao digitar '/'.
          enable_close_on_slash = true
        }
      })
    end
  },

  -- Plugin para auto-fechamento de pares (parênteses, chaves, aspas)
  -- Ajuda a garantir que todos os pares sejam fechados corretamente.
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({
        -- Opções de configuração podem ser adicionadas aqui, se necessário.
        -- Por exemplo, para desativar em certos filetypes: disable_filetype = { "markdown" }
      })
    end
  },

  -- Plugin para iniciar um servidor de desenvolvimento local (Live Server)
  -- Útil para visualizar alterações em tempo real no navegador para projetos web estáticos.
  {
    "barrett-ruth/live-server.nvim",
    config = function()
      require("live-server").setup({
        -- Porta padrão para o servidor.
        port = 3000,
        -- Navegador a ser aberto automaticamente.
        browser = "chrome",
        -- Outras opções como 'root', 'proxy', etc., podem ser configuradas aqui.
      })
      -- Mapeamento para iniciar o Live Server.
      vim.keymap.set("n", "<leader>ls", "<cmd>LiveServerStart<CR>", { desc = "Iniciar Live Server" })
    end
  },

  -- Dependência opcional para melhor tratamento assíncrono em alguns plugins.
  -- Incluído aqui porque 'live-server.nvim' pode se beneficiar dele.
  {
    "nvim-lua/plenary.nvim",
    -- Não há configuração específica para Plenary, ele é uma biblioteca de utilidades.
  },
}