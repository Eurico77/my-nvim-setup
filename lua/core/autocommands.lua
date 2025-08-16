local group = vim.api.nvim_create_augroup("UserAutoCommands", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = group,
  pattern = { "*.ts", "*.js", "*.html", "*.css", "*.go", "*.tsx", "*.jsx" },
  callback = function()
    vim.lsp.buf.format({ async = false, timeout_ms = 5000 })
  end,
  desc = "Formata o arquivo ao salvar usando o LSP.",
})

-- Nossos novos autocomandos para o Neo-tree
vim.api.nvim_create_autocmd("WinEnter", {
    group = group,
    pattern = "*",
    callback = function()
        if vim.bo.filetype == "neo-tree" then
            local keymap_opts = { buffer = true, noremap = true, silent = true }

            vim.keymap.set("n", "a", ":Neotree action=add<CR>", { buffer = true, desc = "Adicionar Arquivo" })
            vim.keymap.set("n", "d", ":Neotree action=add_directory<CR>", { buffer = true, desc = "Adicionar Diretório" })
            vim.keymap.set("n", "<Del>", ":Neotree action=delete<CR>", { buffer = true, desc = "Deletar" })
            vim.keymap.set("n", "x", ":Neotree action=delete<CR>", { buffer = true, desc = "Deletar (x)" })
        end
    end,
    desc = "Define atalhos locais para a janela do Neo-tree"
})

-- Autocomando para evitar o buffer [No Name]
vim.api.nvim_create_autocmd("BufEnter", {
    group = group,
    pattern = "*",
    callback = function()
        local real_buffers = {}
        for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
            if vim.bo[bufnr] and vim.bo[bufnr].buflisted and vim.bo[bufnr].buftype == "" then
                table.insert(real_buffers, bufnr)
            end
        end

        if #real_buffers == 1 then
            local last_buf = real_buffers[1]
            if vim.api.nvim_buf_get_name(last_buf) == "" and #vim.api.nvim_buf_get_lines(last_buf, 0, -1, false) == 1 and vim.api.nvim_buf_get_lines(last_buf, 0, -1, false)[1] == "" then
                require("alpha").start(true)
            end
        end
    end,
    desc = "Mostra o dashboard quando o último buffer é o [No Name]."
})
