-- Configuração do Plugin 'bufferline.nvim'
-- Este plugin exibe uma barra na parte superior do Neovim com os buffers (arquivos abertos) para facilitar a navegação.
return {
    "akinsho/bufferline.nvim",
    config = function()
        require("bufferline").setup({
            options = {
                -- Modo de exibição: 'buffers' mostra todos os buffers, 'tabs' mostra apenas as abas.
                mode = "buffers",
                -- Como exibir os números dos buffers ('none', 'ordinal', 'buffer_id', 'both').
                numbers = "none",
                -- Permite que o tema do Neovim controle as cores da bufferline.
                themable = true,
                -- Ícone para fechar um buffer individual.
                buffer_close_icon = 'x',
                -- Ícone para fechar a bufferline inteira (se aplicável).
                close_icon = 'x ',
                -- Configurações de hover para mostrar informações ao passar o mouse.
                hover = {
                    enabled = true,
                    delay = 200,
                    reveal = {'close'}
                },
                -- Exibe diagnósticos (erros, warnings) do LSP nos buffers.
                diagnostics = "nvim_lsp",
                -- Não atualiza diagnósticos no modo de inserção para evitar lentidão.
                diagnostics_update_in_insert = false,
                -- Estilo dos separadores entre os buffers.
                -- separator_style = "thick",
                -- Não mostra o ícone de fechar em cada buffer.
                show_buffer_close_icons = false,
                -- Não mostra o ícone de fechar geral.
                show_close_icon = false,
                -- Função para formatar a exibição dos diagnósticos.
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    local s = " "
                    for e, n in pairs(diagnostics_dict) do
                        -- Define o símbolo com base no nível do diagnóstico (erro, warning, info).
                        local sym = e == "error" and " " or (e == "warning" and " " or " ")
                        s = s .. n .. sym
                    end
                    return s
                end,
                -- Offsets para alinhar a bufferline com outros elementos (ex: NvimTree).
                offsets = {{
                    filetype = "NvimTree",
                    text = "Explorer",
                    separator = true,
                    text_align = "center"
                }}
            }
        })
    end
}
