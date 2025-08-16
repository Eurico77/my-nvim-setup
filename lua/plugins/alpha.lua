return {
    "goolord/alpha-nvim",
    lazy = false,
    priority = 1000,
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val =
            {"███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
             "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
             "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
             "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
             "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
             "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝"}

        dashboard.section.header.opts.hl = "Type"
        dashboard.section.buttons.opts.hl = "Keyword"

        dashboard.section.buttons.val = {dashboard.button("e", "  Novo arquivo", ":ene <CR>"),
                                         dashboard.button("f", "  Procurar arquivos", ":Telescope find_files <CR>"),
                                         dashboard.button("t", "  Procurar texto", ":Telescope live_grep <CR>"),

                                         dashboard.button("p", "  Listar plugins", ":Telescope plugins <CR>"),

                                         dashboard.button("c", "  Configurações do Neovim", ":e $MYVIMRC <CR>"),

                                         dashboard.button("s", "  Uso do sistema", ":lua _Ghtop()<CR>"),

                                         dashboard.button("r", "  Arquivos recentes", ":Telescope oldfiles <CR>"),
                                         dashboard.button("q", "  Sair", ":qa<CR>")}

        dashboard.section.footer.val = "Eurico Magalhães"
        dashboard.section.footer.opts.hl = "Type"

        alpha.setup(dashboard.opts)
    end
}
