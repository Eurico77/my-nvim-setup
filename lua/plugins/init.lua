local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
                   lazypath})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {"folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {}}, -- Adicionado o tema Tokyo Night
    { import = "plugins.fidget" },
    { import = "plugins.gitsigns" },
    { import = "plugins.indent_blankline" },
    { import = "plugins.nvim_notify" },
    { import = "plugins.barbecue" },
    { import = "plugins.lualine" },
    { import = "plugins.alpha" },
    { import = "plugins.bufferline" },
    { import = "plugins.lsp" },
    {"SmiteshP/nvim-navic"},
    { import = "plugins.cmp" },
    { import = "plugins.telescope" },
    {
        -- import = "plugins.treesitter"
    },
    { import = "plugins.web" },
    { import = "plugins.vimbegood" },
    { import = "plugins.toggleterm" },
    {"christoomey/vim-tmux-navigator"},
    {
        "jake-stewart/multicursor.nvim",
        branch = "1.0",
        config = function()
            local mc = require("multicursor-nvim")
            mc.setup()

            local set = vim.keymap.set

            -- Add or skip cursor above/below the main cursor.
            set({"n", "x"}, "<up>", function() mc.lineAddCursor(-1) end)
            set({"n", "x"}, "<down>", function() mc.lineAddCursor(1) end)
            set({"n", "x"}, "<leader><up>", function() mc.lineSkipCursor(-1) end)
            set({"n", "x"}, "<leader><down>", function() mc.lineSkipCursor(1) end)

            -- Add or skip adding a new cursor by matching word/selection
            set({"n", "x"}, "<leader>n", function() mc.matchAddCursor(1) end)
            set({"n", "x"}, "<leader>s", function() mc.matchSkipCursor(1) end)
            set({"n", "x"}, "<leader>N", function() mc.matchAddCursor(-1) end)
            set({"n", "x"}, "<leader>S", function() mc.matchSkipCursor(-1) end)

            -- Add and remove cursors with control + left click.
            set("n", "<c-leftmouse>", mc.handleMouse)
            set("n", "<c-leftdrag>", mc.handleMouseDrag)
            set("n", "<c-leftrelease>", mc.handleMouseRelease)

            -- Disable and enable cursors.
            set({"n", "x"}, "<c-q>", mc.toggleCursor)

            -- Mappings defined in a keymap layer only apply when there are
            -- multiple cursors. This lets you have overlapping mappings.
            mc.addKeymapLayer(function(layerSet)

                -- Select a different cursor as the main one.
                layerSet({"n", "x"}, "<left>", mc.prevCursor)
                layerSet({"n", "x"}, "<right>", mc.nextCursor)

                -- Delete the main cursor.
                layerSet({"n", "x"}, "<leader>x", mc.deleteCursor)

                -- Enable and clear cursors using escape.
                layerSet("n", "<esc>", function()
                    if not mc.cursorsEnabled() then
                        mc.enableCursors()
                    else
                        mc.clearCursors()
                    end
                end)
            end)

            -- Customize how cursors look.
            local hl = vim.api.nvim_set_hl
            hl(0, "MultiCursorCursor", { reverse = true })
            hl(0, "MultiCursorVisual", { link = "Visual" })
            hl(0, "MultiCursorSign", { link = "SignColumn"})
            hl(0, "MultiCursorMatchPreview", { link = "Search" })
            hl(0, "MultiCursorDisabledCursor", { reverse = true })
            hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
            hl(0, "MultiCursorDisabledSign", { link = "SignColumn"})
        end
    },
    { import = "plugins.neo-tree" }
})

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

