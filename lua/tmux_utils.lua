local M = {}

function M.run_detached(cmd)
    local session_name = "nvim_detached_" .. os.time() -- Unique session name
    local current_dir = vim.fn.getcwd()

    -- Create a new detached session, run the command, and then attach
    local tmux_cmd = string.format("tmux new-session -d -s %s -c %s '%s' && tmux attach-session -t %s", session_name,
        current_dir, cmd, session_name)

    vim.fn.system(tmux_cmd)
    print("Running command in detached Tmux session: " .. session_name)
end

function M.detach_current()
    vim.fn.system("tmux detach")
    print("Detached from current Tmux session.")
end

return M
