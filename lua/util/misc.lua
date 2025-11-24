local M = {}

M.nvimtree_drag_files = function()
    local api = require("nvim-tree.api")
    -- Check if 'dragon' is available
    if vim.fn.executable("dragon") == 0 then
        vim.notify("'dragon' is not installed or not in PATH", vim.log.levels.ERROR)
        return
    end

    -- Get all marked nodes (or fallback to node under cursor)
    local nodes = api.marks.list()
    if #nodes == 0 then
        local single = api.tree.get_node_under_cursor()
        if not single then
            vim.notify("No file or folder selected", vim.log.levels.WARN)
            return
        end
        nodes = { single }
    end

    -- Extract all absolute paths
    local paths = {}
    for _, node in ipairs(nodes) do
        if node.absolute_path then
            table.insert(paths, node.absolute_path)
        end
    end

    -- No paths collected
    if #paths == 0 then
        vim.notify("No valid paths to send to dragon", vim.log.levels.WARN)
        return
    end

    -- Run `dragon --and-exit <paths>` in background
    local uv = vim.loop
    uv.spawn("dragon", {
        args = vim.list_extend({ "--and-exit" }, paths),
        detached = true,
    }, function(code, signal)
        if code ~= 0 then
            vim.schedule(function()
                vim.notify("dragon failed with exit code " .. code, vim.log.levels.ERROR)
            end)
        end
    end)
    api.marks.clear()
end

return M
