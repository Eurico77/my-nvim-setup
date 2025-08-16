return {{
    "windwp/nvim-ts-autotag",
    config = function()
        require("nvim-ts-autotag").setup({
            filetypes = {"html", "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte", "vue",
                         "tsx", "jsx", "rescript", "xml", "php", "markdown"},
            skip_tags = {"area", "base", "br", "col", "command", "embed", "hr", "img", "slot", "input", "keygen",
                         "link", "meta", "param", "source", "track", "wbr"},
            opts = {
                enable_close = true,
                enable_rename = true,
                enable_close_on_slash = true
            }
        })
    end
}, {
    "windwp/nvim-autopairs",
    config = function()
        require("nvim-autopairs").setup({})
    end
}, {
    "barrett-ruth/live-server.nvim",
    config = function()
        require("live-server").setup({
            port = 3000,
            browser = "chrome"
        })
        vim.keymap.set("n", "<leader>ls", "<cmd>LiveServerStart<CR>", {
            desc = "Iniciar Live Server"
        })
    end
}, {"nvim-lua/plenary.nvim"}}
