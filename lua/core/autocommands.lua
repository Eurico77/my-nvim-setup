local group = vim.api.nvim_create_augroup("UserAutoCommands", {
    clear = true
})

vim.api.nvim_create_autocmd("BufWritePre", {
    group = group,
    pattern = {"*.ts", "*.js", "*.html", "*.css", "*.go", "*.tsx", "*.jsx"},
    callback = function()
        vim.lsp.buf.format({
            async = false,
            timeout_ms = 5000
        })
    end,
    desc = "Formata o arquivo ao salvar usando o LSP."
})

vim.api.nvim_create_autocmd("WinEnter", {
    group = group,
    pattern = "*",
    callback = function()
        if vim.bo.filetype == "neo-tree" then
            local keymap_opts = {
                buffer = true,
                noremap = true,
                silent = true
            }

            vim.keymap.set("n", "a", ":Neotree action=add<CR>", {
                buffer = true,
                desc = "Adicionar Arquivo"
            })
            vim.keymap.set("n", "d", ":Neotree action=delete<CR>", {
                buffer = true,
                desc = "deletar"
            })
            vim.keymap.set("n", "r", ":Neotree action=rename<CR>", {
                buffer = true,
                desc = "Renomear"
            })
            vim.keymap.set("n", "<Del>", ":Neotree action=delete<CR>", {
                buffer = true,
                desc = "Deletar"
            })

        end
    end,
    desc = "Define atalhos locais para a janela do Neo-tree"
})

