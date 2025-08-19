return {{
    "nvim-treesitter/nvim-treesitter-context",
    lazy = true,
    config = function()
        require("treesitter-context").setup({
            enable = true,
            max_lines = 1,
            min_window_height = 0,
            line_numbers = true,
            multiline_threshold = 20,
            trim_scope = "outer",
            mode = "cursor",
            separator = nil,
            zindex = 20,
            on_attach = nil
        })
    end
}, {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {"windwp/nvim-ts-autotag", "nvim-treesitter/nvim-treesitter-context"},
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {"typescript", "javascript", "html", "css", "lua", "tsx", "jsx", "json", "markdown"},
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false
            },
            indent = {
                enable = true
            },
            autotag = {
                enable = true,
                filetypes = {"html", "javascript", "typescript", "javascriptreact", "typescriptreact", "tsx", "jsx",
                             "svelte", "vue"}
            }
        })
    end
}, {
    "norcalli/nvim-colorizer.lua",
    config = function()
        require("colorizer").setup()
    end
}, {
    "fladson/vim-kitty",
    ft = "kitty.conf",
    event = "VeryLazy"
}}
