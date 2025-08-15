-- Autocomandos do Neovim
-- Este arquivo contém comandos automáticos que são executados em resposta a eventos específicos no Neovim.

local group = vim.api.nvim_create_augroup("UserAutoCommands", { clear = true })

-- Formatação automática ao salvar
-- Este autocomando é acionado sempre que um buffer está prestes a ser salvo (BufWritePre).
-- Ele executa o formatador do LSP (Language Server Protocol) de forma síncrona.
-- O 'pattern' restringe a execução apenas para os tipos de arquivo especificados.
vim.api.nvim_create_autocmd("BufWritePre", {
  group = group,
  pattern = { "*.ts", "*.js", "*.html", "*.css", "*.go", "*.tsx", "*.jsx" },
  callback = function()
    vim.lsp.buf.format({ async = false, timeout_ms = 5000 })
  end,
  desc = "Formata o arquivo ao salvar usando o LSP.",
})
