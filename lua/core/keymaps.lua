local keymap = vim.keymap.set

-- Move to the beginning and end of the line in insert mode
keymap("i", "<C-a>", "<ESC>^i")
keymap("i", "<C-e>", "<ESC>$a")


-- Criar nova aba
keymap("n", "<leader>tn", ":tabnew<CR>", { desc = "New Tab" }) -- Nova aba

-- Fechar aba atual
keymap("n", "<leader>tc", ":tabclose<CR>", { desc = "Close Tab" }) -- Fechar aba

-- Fechar todas as abas, exceto a atual
keymap("n", "<leader>to", ":tabonly<CR>", { desc = "Close Other Tabs" }) -- Fechar outras abas

-- Salvar arquivo (funciona em modo Normal e Insert)
keymap({ "n", "i" }, "<C-s>", ":w<CR>")


-- =============================================
-- 2. Navegação entre Janelas
-- =============================================
-- Movimento entre splits
keymap("n", "<C-h>", "<C-w>h") -- Esquerda
keymap("n", "<C-j>", "<C-w>j") -- Baixo
keymap("n", "<C-k>", "<C-w>k") -- Cima
keymap("n", "<C-l>", "<C-w>l") -- Direita

-- Criar splits
keymap("n", "<leader>v", "<cmd>vsplit<CR>", { desc = "Vertical Split" })
keymap("n", "<leader>h", "<cmd>split<CR>", { desc = "Horizontal Split" })

-- =============================================
-- 3. Trabalhando com Abas/Buffers
-- =============================================
-- Navegação entre buffers
keymap("n", "<C-Tab>", ":BufferLineCycleNext<CR>")
keymap("n", "<C-S-Tab>", ":BufferLineCyclePrev<CR>")

-- Fechar buffer
keymap("n", "<C-w>", ":bdelete<CR>")

-- Listar buffers
keymap("n", "<leader>b", ":Telescope buffers<CR>")

-- =============================================
-- 4. Busca e Ferramentas
-- =============================================
-- Buscar arquivos
keymap("n", "<C-p>", ":Telescope find_files<CR>")

-- Buscar texto no projeto
keymap("n", "<C-f>", ":Telescope live_grep<CR>")

-- Comentar código (requer plugin Comment.nvim)
keymap({ "n", "v" }, "<C-/>", ":CommentToggle<CR>")

-- =============================================
-- 5. Formatação Automática
-- =============================================
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.tsx", "*.jsx", "*.ts", "*.js", "*.go", "*.css", "*.html" },
  callback = function()
    vim.lsp.buf.format()
  end
})