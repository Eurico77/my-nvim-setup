return {
    "nvim-lualine/lualine.nvim",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
        require("lualine").setup({
            options = {
                theme = "catppuccin",
                component_separators = {
                    left = "",
                    right = ""
                },
                section_separators = {
                    left = "",
                    right = ""
                },
                disabled_filetypes = {"NvimTree"},
                globalstatus = true
            },
            sections = {
                lualine_a = {"mode"},
                lualine_b = {"branch"},
                lualine_c = {{
                    'filename',
                    path = 1,
                    shorting_rule = 'truncate_from_right'
                }, {
                    "diff",
                    symbols = {
                        added = " ",
                        modified = " ",
                        removed = " "
                    }
                }},
                lualine_x = {'lsp_client', {
                    "diagnostics",
                    sources = {"nvim_diagnostic"},
                    symbols = {
                        error = " ",
                        warn = " ",
                        info = " ",
                        hint = " "
                    }
                }, "encoding", "filetype"},
                lualine_y = {"progress"},
                lualine_z = {"location"}
            },
            extensions = {"nvim-tree"}
        })
        vim.cmd("highlight LualineNormal guibg=NONE")
        vim.cmd("highlight LualineNormalNC guibg=NONE")
        vim.cmd("highlight BufferLineFill guibg=NONE")
    end
}
