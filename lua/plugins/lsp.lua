return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({})
    end
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      local servers_to_install = {
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "eslint",
        "emmet_ls",
        "gopls",
        "prismals",
      }

      local on_attach = function(client, bufnr)
        if client.server_capabilities.documentSymbolProvider then
          require("nvim-navic").attach(client, bufnr)
        end

        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
        vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
        vim.keymap.set("n", "<leader>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, bufopts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)
      end

      local capabilities = cmp_nvim_lsp.default_capabilities()

      mason_lspconfig.setup({
        ensure_installed = servers_to_install,
        handlers = {
          function(server_name)
            local opts = {
              on_attach = on_attach,
              capabilities = capabilities,
            }

            if server_name == "gopls" then
              opts.settings = {
                gopls = {
                  analyses = { unusedparams = true },
                  staticcheck = true,
                },
              }
            end

            if server_name == "ts_ls" then
              opts.filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }
              opts.settings = {
                completions = { completeFunctionCalls = true },
                inlayHints = {
                  includeInlayParameterNameHints = "all"
                }
              }
            end

            if server_name == "html" then
              opts.filetypes = { "html", "javascriptreact", "typescriptreact" }
            end

            if server_name == "cssls" then
              opts.settings = {
                css = { completion = { completePropertyWithSemicolon = true } }
              }
            end

            if server_name == "emmet_ls" then
              opts.filetypes = { "html", "css", "javascriptreact", "typescriptreact" }
            end

            lspconfig[server_name].setup(opts)
          end,
        },
      })
    end
  },

  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({
        toggler = {
          line = "<C-/>",
        },
      })
    end
  },
}