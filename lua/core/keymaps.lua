vim.g.mapleader = " "

local keymap = vim.keymap.set

keymap({ "n", "i" }, "<C-s>", ":w<CR>", { desc = "Salvar arquivo" })

keymap({ "n", "v" }, "<C-/>", ":CommentToggle<CR>", { desc = "Comentar/Descomentar linha" })

keymap("i", "<C-a>", "<ESC>^i", { desc = "Ir para o início da linha" })
keymap("i", "<C-e>", "<ESC>$a", { desc = "Ir para o fim da linha" })
keymap("i", "jk", "<Esc>", { desc = "Sair do modo de inserção com jk" })

keymap("n", "<leader>v", "<cmd>vsplit<CR>", { desc = "Split Vertical" })
keymap("n", "<leader>h", "<cmd>split<CR>", { desc = "Split Horizontal" })

keymap("n", "<leader>sc", "<C-w>c", { desc = "Fechar split atual" })

keymap("n", "<C-h>", "<C-w>h", { desc = "Mover para o split à esquerda" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Mover para o split abaixo" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Mover para o split acima" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Mover para o split à direita" })

keymap("n", "<leader>tn", ":tabnew<CR>", { desc = "Nova Aba" })

keymap("n", "<leader>tc", ":tabclose<CR>", { desc = "Fechar Aba Atual" })

keymap("n", "<leader>to", ":tabonly<CR>", { desc = "Fechar Outras Abas" })

keymap("n", "<S-n>", ":BufferLineCycleNext<CR>", { desc = "Próximo Buffer" })
keymap("n", "<S-p>", ":BufferLineCyclePrev<CR>", { desc = "Buffer Anterior" })

keymap("n", "<C-w>", ":bdelete<CR>", { desc = "Fechar Buffer" })

keymap("n", "<leader>b", ":Telescope buffers<CR>", { desc = "Listar Buffers" })

keymap("n", "<C-p>", ":Telescope find_files<CR>", { desc = "Buscar Arquivos" })

keymap("n", "<C-f>", ":Telescope live_grep<CR>", { desc = "Buscar Texto no Projeto" })

-- NOSSOS NOVOS ATALHOS

-- Explorer (NeoTree)
keymap("n", "<leader>e", function()
    local neo_tree_is_open = false
    local neo_tree_is_focused = false
    local current_win = vim.api.nvim_get_current_win()

    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local bufnr = vim.api.nvim_win_get_buf(win)
        if vim.bo[bufnr] and vim.bo[bufnr].filetype == "neo-tree" then
            neo_tree_is_open = true
            if win == current_win then
                neo_tree_is_focused = true
            end
            break
        end
    end

    if neo_tree_is_focused then
        vim.cmd("Neotree close")
    elseif neo_tree_is_open then
        vim.cmd("Neotree focus")
    else
        vim.cmd("Neotree show")
    end
end, { desc = "Abrir/Focar/Fechar o Explorer" })

-- Edição Padrão (Copiar, Colar, Desfazer, Refazer)
keymap("v", "<C-c>", '"+y', { desc = "Copiar para a área de transferência" })
keymap("n", "<C-v>", '"+P', { desc = "Colar da área de transferência (antes)" })
keymap("v", "<C-v>", '"+P', { desc = "Colar da área de transferência (substituir)" })
keymap("i", "<C-v>", '<C-r>+', { desc = "Colar da área de transferência" })
keymap({"n", "v", "i"}, "<C-z>", "<cmd>undo<CR>", { desc = "Desfazer" })
keymap({"n", "v", "i"}, "<C-y>", "<cmd>redo<CR>", { desc = "Refazer" })

-- Multi-cursor e Refatoração

keymap("n", "<C-r>", function() vim.lsp.buf.rename() end, { desc = "Renomear (LSP)" })

-- LSP (Linguagem)
keymap("n", "<C-t>", function() vim.lsp.buf.hover() end, { desc = "Ver documentação/tipo (Hover)" })
keymap("n", "gT", function() vim.lsp.buf.type_definition() end, { desc = "Ir para a definição do tipo" })