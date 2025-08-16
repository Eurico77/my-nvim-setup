return {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup({
            open_mapping = [[<leader>t]],
            direction = "horizontal",
            close_on_exit = true
        })
    end
}
