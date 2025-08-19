return {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    config = function()

        -- Navegação transparente entre paineis do Vim e Tmux
        vim.keymap.set("n", "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", {
            desc = "Tmux: Navigate Left"
        })
        vim.keymap.set("n", "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>", {
            desc = "Tmux: Navigate Down"
        })
        vim.keymap.set("n", "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>", {
            desc = "Tmux: Navigate Up"
        })
        vim.keymap.set("n", "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>", {
            desc = "Tmux: Navigate Right"
        })
        vim.keymap.set("n", "<c-\">", "<cmd><C-U>TmuxNavigatePrevious<cr>", {
            desc = "Tmux: Navigate Previous"
        })

        -- --- Scratchpad Terminal Flutuante (versão corrigida e mais robusta) ---

        local function toggle_scratchpad()
            vim.fn.jobstart({
                "tmux",
                "display-popup",
                "-w", "100%", -- Largura total
                "-h", "35%",  -- 35% da altura
                "-x", "0",    -- Alinhado à esquerda
                "-y", "100%", -- Alinhado na parte de baixo
                "-E",
                -- Este comando é executado pelo shell do popup, então aspas são seguras aqui
                "tmux attach-session -t scratchpad || tmux new-session -s scratchpad"
            })
        end

        -- 1. Atalho para MOSTRAR / OCULTAR o terminal
        vim.keymap.set("n", "<leader>tt", toggle_scratchpad, {
            desc = "Tmux: Alternar terminal flutuante (scratchpad)"
        })

        -- O mapeamento para o modo terminal chama a função Lua diretamente
        vim.keymap.set("t", "<leader>tt", "<c-\"><c-n>:lua toggle_scratchpad()<cr>", {
            desc = "Tmux: Alternar terminal flutuante (scratchpad)"
        })

        -- 2. Atalho para FECHAR permanentemente o terminal e seus processos
        vim.keymap.set("n", "<leader>tK", function()
            vim.fn.jobstart({"tmux", "kill-session", "-t", "scratchpad"})
        end, {
            desc = "Tmux: Matar sessão do terminal flutuante"
        })

        -- 3. (Avançado) Atalho para ENVIAR um comando para o terminal sem abri-lo
        vim.keymap.set("n", "<leader>tx", function()
            local cmd = vim.fn.input("Comando para enviar ao scratchpad: ")
            if cmd ~= "" then
                vim.fn.jobstart({'tmux', 'send-keys', '-t', 'scratchpad:0.0', cmd, 'Enter'})
                vim.notify("Comando enviado para o scratchpad!", vim.log.levels.INFO)
            end
        end, {
            desc = "Tmux: Executar comando no scratchpad"
        })

    end
}

