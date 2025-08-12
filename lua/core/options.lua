
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

-- Fonte e espaçamento
vim.opt.guifont = "JetBrains Mono:h14"
if vim.g.neovide then
  vim.g.neovide_line_height = 18 -- Funciona apenas em GUIs
end
vim.cmd([[set showtabline=2]])
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250"


-- Highlight de linha atual
vim.opt.cursorline = true

-- Habilitar recuo inteligente
vim.opt.smartindent = true

-- -- Habilitar highlight de busca
vim.opt.hlsearch = true
vim.opt.incsearch = true