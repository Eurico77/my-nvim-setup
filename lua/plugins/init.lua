local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Instalar Lazy.nvim se necessário
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Interface
  { import = "plugins.ui" },       -- Temas, barras, ícones
  { import = "plugins.languages" },-- Configs específicas por linguagem
  
  -- Funcionalidades
  { import = "plugins.lsp" },      -- LSP e autocompletion
  { import = "plugins.cmp" },      -- Engine de autocomplete
  { import = "plugins.telescope" },      -- Engine de autocomplete
  { import = "plugins.treesitter" }, -- Syntax Highlighting

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<leader>t]],
        direction = "horizontal",
        close_on_exit = true,
      })
    end,
  },
})