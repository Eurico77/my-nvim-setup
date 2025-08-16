return {
    "utilyre/barbecue.nvim",
    dependencies = {"SmiteshP/nvim-navic", "nvim-tree/nvim-web-devicons"},
    config = function()
        require("barbecue").setup({
            theme = {
                normal = {
                    bg = "NONE",
                    fg = vim.api.nvim_get_hl_by_name("Normal", true).foreground
                }
            }
        })
    end
}
