-- Formatação ao salvar
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.ts", "*.js", "*.html", "*.css", "*.go" },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end
})