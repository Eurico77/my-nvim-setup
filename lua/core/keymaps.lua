-- Define a tecla Leader globalmente. Deve ser definida antes de qualquer mapeamento que a utilize.
-- A tecla Leader é uma tecla especial que você pressiona antes de uma sequência de teclas para executar um atalho.
vim.g.mapleader = " "

-- Atalhos do Neovim
-- Este arquivo centraliza todos os mapeamentos de teclas para facilitar a manutenção.

local keymap = vim.keymap.set

-- =============================================
-- 1. Atalhos Gerais e de Edição
-- =============================================

-- Salvar arquivo (funciona em modo Normal e de Inserção)
keymap({ "n", "i" }, "<C-s>", ":w<CR>", { desc = "Salvar arquivo" })

-- Comentar código (requer o plugin Comment.nvim)
-- Alterna o comentário da linha ou seleção atual.
keymap({ "n", "v" }, "<C-/>", ":CommentToggle<CR>", { desc = "Comentar/Descomentar linha" })

-- Mover para o início e fim da linha no modo de inserção
keymap("i", "<C-a>", "<ESC>^i", { desc = "Ir para o início da linha" })
keymap("i", "<C-e>", "<ESC>$a", { desc = "Ir para o fim da linha" })

-- =============================================
-- 2. Navegação entre Janelas (Splits)
-- =============================================

-- Criar novos splits
keymap("n", "<leader>v", "<cmd>vsplit<CR>", { desc = "Split Vertical" })
keymap("n", "<leader>h", "<cmd>split<CR>", { desc = "Split Horizontal" })

-- Fechar o split atual
keymap("n", "<leader>sc", "<C-w>c", { desc = "Fechar split atual" })

-- Mover entre splits usando Ctrl + teclas de direção do Vim
keymap("n", "<C-h>", "<C-w>h", { desc = "Mover para o split à esquerda" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Mover para o split abaixo" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Mover para o split acima" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Mover para o split à direita" })

-- =============================================
-- 3. Gerenciamento de Abas e Buffers
-- =============================================

-- Criar nova aba
keymap("n", "<leader>tn", ":tabnew<CR>", { desc = "Nova Aba" })

-- Fechar aba atual
keymap("n", "<leader>tc", ":tabclose<CR>", { desc = "Fechar Aba Atual" })

-- Fechar todas as outras abas
keymap("n", "<leader>to", ":tabonly<CR>", { desc = "Fechar Outras Abas" })

-- Navegar entre buffers (requer o plugin BufferLine)
keymap("n", "<S-n>", ":BufferLineCycleNext<CR>", { desc = "Próximo Buffer" })
keymap("n", "<S-p>", ":BufferLineCyclePrev<CR>", { desc = "Buffer Anterior" })

-- Fechar buffer atual
keymap("n", "<C-w>", ":bdelete<CR>", { desc = "Fechar Buffer" })

-- =============================================
-- 4. Ferramentas e Plugins (Telescope)
-- =============================================

-- Listar e navegar entre buffers abertos
keymap("n", "<leader>b", ":Telescope buffers<CR>", { desc = "Listar Buffers" })

-- Buscar arquivos no projeto
keymap("n", "<C-p>", ":Telescope find_files<CR>", { desc = "Buscar Arquivos" })

-- Buscar texto em todo o projeto
keymap("n", "<C-f>", ":Telescope live_grep<CR>", { desc = "Buscar Texto no Projeto" })


