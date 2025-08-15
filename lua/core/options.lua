-- Arquivo de Opções do Neovim
-- Este arquivo contém as configurações globais do editor.

-- Define o provedor de clipboard padrão para usar o clipboard do sistema.
-- Isso permite que você copie (y) e cole (p) de e para fora do Neovim.
vim.opt.clipboard = "unnamedplus"

-- Configurações de Tabulação e Indentação
-- Define o número de espaços que um <Tab> representa.
vim.opt.tabstop = 2
-- Define o número de espaços para usar na indentação automática.
vim.opt.shiftwidth = 2
-- Usa espaços em vez de tabs.
vim.opt.expandtab = true
-- Habilita a indentação inteligente que respeita a estrutura do código.
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Aparência do Editor
-- Habilita cores de 24-bit no terminal.
vim.opt.termguicolors = true
-- Mostra o número da linha atual.
vim.opt.number = true
-- Mostra o número relativo das linhas (útil para movimentos verticais).
vim.opt.relativenumber = true
-- Habilita o uso do mouse no Neovim.
vim.opt.mouse = "a"
-- Mostra a coluna de sinais (para git signs, diagnósticos, etc.).
vim.opt.signcolumn = "yes"
-- Destaca a linha onde o cursor está posicionado.
vim.opt.cursorline = true
-- Define a fonte e o tamanho a ser usado em GUIs como Neovide ou Gnvim.
vim.opt.guifont = "JetBrains Mono:h14"
-- Evita a quebra de linhas longas.
vim.opt.wrap = false
-- Define os caracteres usados para preencher a UI do Neovim (ex: para dobras de código).
vim.opt.fillchars = {
  eob = " ",
  fold = " ",
  foldopen = "",
  foldsep = " ",
  foldclose = "",
}

-- Comportamento da Busca
-- Realça os resultados da busca.
vim.opt.hlsearch = true
-- Mostra os resultados da busca enquanto você digita.
vim.opt.incsearch = true

-- Desempenho e Comportamento Geral
-- Desabilita a criação de arquivos de backup.
vim.opt.backup = false
vim.opt.writebackup = false
-- Desabilita a criação de arquivos de swap.
vim.opt.swapfile = false
-- Define o tempo em milissegundos para o Neovim atualizar a tela.
vim.opt.updatetime = 50
-- Define o tempo em milissegundos para esperar por uma sequência de mapeamento de teclas.
vim.opt.timeoutlen = 300
-- Aumenta o histórico de comandos.
vim.opt.history = 1000

-- Configuração específica para Neovide (GUI)
if vim.g.neovide then
  vim.g.neovide_line_height = 18 -- Ajusta a altura da linha
end

-- Mostra a linha de abas sempre.
vim.cmd([[set showtabline=2]])

-- Configuração do cursor para diferentes modos.
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250"