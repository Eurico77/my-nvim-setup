return {
    "akinsho/bufferline.nvim",
    config = function()
        require("bufferline").setup({
            options = {
                mode = "buffers",
                numbers = "none",
                themable = true,
                buffer_close_icon = 'x',
                close_icon = 'x ',
                hover = {
                    enabled = true,
                    delay = 200,
                    reveal = {'close'}
                },
                diagnostics = "nvim_lsp",
                diagnostics_update_in_insert = false,
                separator_style = "",
                show_buffer_close_icons = true,
                show_close_icon = false,
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    local s = " "
                    for e, n in pairs(diagnostics_dict) do
                        local sym = e == "error" and " " or (e == "warning" and " " or " ")
                        s = s .. n .. sym
                    end
                    return s
                end,
                offsets = {{
                    filetype = "neo-tree",
                    text = "Explorer",
                    highlight = "Directory",
                    text_align = "left"
                    -- separator = true
                }}
            }
        })
    end
}
