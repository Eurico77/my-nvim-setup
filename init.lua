require("core.options")
require("core.keymaps")
require("core.autocommands")

require("plugins")

vim.cmd.colorscheme "catppuccin-mocha" -- Define o tema Catppuccin Mocha
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Load tmux_utils and create commands
local tmux_utils = require("tmux_utils")
vim.api.nvim_create_user_command("TmuxRunDetached", function(args)
    tmux_utils.run_detached(args.args)
end, { nargs = 1, complete = "command", desc = "Run command in a new detached Tmux session and attach" })

vim.api.nvim_create_user_command("TmuxDetach", function()
    tmux_utils.detach_current()
end, { nargs = 0, desc = "Detach from current Tmux session" })