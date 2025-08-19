local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
                   lazypath})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({{
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
}, -- Adicionado o tema Tokyo Night {
{
    import = "plugins.fidget"
}, {
    import = "plugins.gitsigns"
}, {
    import = "plugins.indent_blankline"
}, {
    import = "plugins.nvim_notify"
}, {
    import = "plugins.barbecue"
}, {
    import = "plugins.lualine"
}, {
    import = "plugins.alpha"
}, {
    import = "plugins.bufferline"
}, {
    import = "plugins.lsp"
}, {"SmiteshP/nvim-navic"}, {
    import = "plugins.cmp"
}, {
    import = "plugins.telescope"
}, {
    import = "plugins.web"
}, {
    import = "plugins.vimbegood"
}, {
    import = "plugins.tmux"
}, {
    import = "plugins.neo-tree"
}, {}})

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        -- Desativa itálico para o nome do arquivo no Neo-tree (se estiver usando este grupo)
        vim.api.nvim_set_hl(0, "NeoTreeFileName", {
            italic = false
        })
        -- Desativa itálico para nomes de diretórios (se estiver usando este grupo)
        vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", {
            italic = false
        })
        -- Desativa itálico para comentários (muitas vezes a causa)
        vim.api.nvim_set_hl(0, "Comment", {
            italic = false
        })
        -- Desativa itálico para identificadores (variáveis, funções, etc.)
        vim.api.nvim_set_hl(0, "Identifier", {
            italic = false
        })
        -- Desativa itálico para strings
        vim.api.nvim_set_hl(0, "String", {
            italic = false
        })
        -- Desativa itálico para constantes
        vim.api.nvim_set_hl(0, "Constant", {
            italic = false
        })
        -- Desativa itálico para os grupos de status do Git no Neo-tree
        vim.api.nvim_set_hl(0, "NeoTreeGitAdded", {
            italic = false
        })
        vim.api.nvim_set_hl(0, "NeoTreeGitModified", {
            italic = false
        })
        vim.api.nvim_set_hl(0, "NeoTreeGitDeleted", {
            italic = false
        })
        vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", {
            italic = false
        })
        vim.api.nvim_set_hl(0, "NeoTreeGitIgnored", {
            italic = false
        })
    end
})

