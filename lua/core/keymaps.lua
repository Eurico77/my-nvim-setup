vim.g.mapleader = " "

local keymap = vim.keymap.set

keymap({"n", "i"}, "<C-s>", ":w<CR>", {
    desc = "Salvar arquivo"
})

keymap({"n", "v"}, "<C-/>", ":CommentToggle<CR>", {
    desc = "Comentar/Descometa linha"
})

-- keymap("i", "<C-a>", "<ESC>^i", {
--     desc = "Ir para o início da linha"
-- })
-- keymap("i", "<C-e>", "<ESC>$a", {
--     desc = "Ir para o fim da linha"
-- })
keymap("i", "jk", "<Esc>", {
    desc = "Sair do modo de inserção com jk"
})

keymap("n", "<leader>v", "<cmd>vsplit<CR>", {
    desc = "Split Vertical"
})
keymap("n", "<leader>h", "<cmd>split<CR>", {
    desc = "Split Horizontal"
})

keymap("n", "<leader>sc", "<C-w>c", {
    desc = "Fechar split atual"
})
keymap("n", "<leader>q", ":qa!<CR>", {
    desc = "Sair de tudo"
})

keymap("n", "<C-h>", "<C-w>h", {
    desc = "Mover para o split à esquerda"
})
keymap("n", "<C-j>", "<C-w>j", {
    desc = "Mover para o split abaixo"
})
keymap("n", "<C-k>", "<C-w>k", {
    desc = "Mover para o split acima"
})
keymap("n", "<C-l>", "<C-w>l", {
    desc = "Mover para o split à direita"
})

keymap("n", "<leader>tn", ":tabnew<CR>", {
    desc = "Nova Aba"
})

keymap("n", "<leader>tc", ":tabclose<CR>", {
    desc = "Fechar Aba Atual"
})

keymap("n", "<leader>to", ":tabonly<CR>", {
    desc = "Fechar Outras Abas"
})

keymap("n", "<S-n>", ":BufferLineCycleNext<CR>", {
    desc = "Próximo Buffer"
})
keymap("n", "<S-p>", ":BufferLineCyclePrev<CR>", {
    desc = "Buffer Anterior"
})

keymap("n", "<C-w>", ":bdelete<CR>", {
    desc = "Fechar Buffer"
})

keymap("n", "<leader>b", ":Telescope buffers<CR>", {
    desc = "Listar Buffers"
})

keymap("n", "<leader>f", ":Neotree focus<CR>", {
    desc = "Focar no Neo-tree"
})

keymap("n", "<C-p>", ":Telescope find_files<CR>", {
    desc = "Buscar Arquivos"
})

keymap("n", "<C-f>", ":Telescope live_grep<CR>", {
    desc = "Buscar Texto no Projeto"
})

-- NOSSOS NOVOS ATALHOS

-- Explorer (NeoTree)

keymap("v", "<C-c>", '"+y', {
    desc = "Copiar para a área de transferência"
})
keymap("n", "<C-v>", '"+P', {
    desc = "Colar da área de transferência (antes)"
})
keymap("v", "<C-v>", '"+P', {
    desc = "Colar da área de transferência (substituir)"
})
keymap("i", "<C-v>", '<C-r>+', {
    desc = "Colar da área de transferência"
})
keymap({"n", "v", "i"}, "<C-z>", "<cmd>undo<CR>", {
    desc = "Desfazer"
})
keymap({"n", "v", "i"}, "<C-y>", "<cmd>redo<CR>", {
    desc = "Refazer"
})

-- Multi-cursor e Refatoração
keymap("n", "<C-r>", function()
    vim.lsp.buf.rename()
end, {
    desc = "Renomear (LSP)"
})

-- LSP (Linguagem)
keymap("n", "<C-t>", function()
    vim.lsp.buf.hover()
end, {
    desc = "Ver documentação/tipo (Hover)"
})
keymap("n", "gT", function()
    vim.lsp.buf.type_definition()
end, {
    desc = "Ir para a definição do tipo"
})

