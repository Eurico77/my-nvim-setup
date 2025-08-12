return {
  -- LSPs para Web
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local lsp = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- TypeScript/JavaScript/React
      lsp.ts_ls.setup({
        capabilities = capabilities,
        filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
        settings = {
          completions = { completeFunctionCalls = true },
          inlayHints = {
            includeInlayParameterNameHints = "all"
          }
        }
      })

      -- HTML
      lsp.html.setup({
        capabilities = capabilities,
        filetypes = { "html", "javascriptreact", "typescriptreact" }
      })

      -- CSS
      lsp.cssls.setup({
        capabilities = capabilities,
        settings = {
          css = { completion = { completePropertyWithSemicolon = true } }
        }
      })

      -- Emmet
      lsp.emmet_ls.setup({
        capabilities = capabilities,
        filetypes = { "html", "css", "javascriptreact", "typescriptreact" }
      })
    end
  },

  -- BrowserSync CLI
{
  "nvim-lua/plenary.nvim", -- Optional dependency for better async handling
  config = function()
    vim.keymap.set("n", "<leader>bs", function()
      
    end, { desc = "Start BrowserSync" })

    vim.keymap.set("n", "<leader>bt", function()
      vim.cmd("!pkill -f browser-sync")
    end, { desc = "Stop BrowserSync" })
  end
},

-- Live Server
{
  "barrett-ruth/live-server.nvim",
  config = function()
    require("live-server").setup({
      port = 3000,
      browser = "chrome",
    })
    vim.keymap.set("n", "<leader>ls", "<cmd>LiveServerStart<CR>", { desc = "Start Live Server" })
  end
},


  -- Autotag para JSX/TSX (configuração melhorada)
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({
        filetypes = {
          "html", "javascript", "typescript",
          "javascriptreact", "typescriptreact",
          "svelte", "vue", "tsx", "jsx", "rescript",
          "xml", "php", "markdown"
        },
        skip_tags = {
          "area", "base", "br", "col", "command", "embed", 
          "hr", "img", "slot", "input", "keygen", "link", 
          "meta", "param", "source", "track", "wbr"
        }
      })
    end
  },

  -- Extensão opcional para melhor experiência HTML
  {
    "natebosch/vim-lsc",
    config = function()
      vim.g.lsc_auto_map = true
      vim.g.lsc_enable_autocomplete = true
    end
  }
}
