local M = {}

local conf_path = vim.fn.stdpath("config") --[[@as string]]
local data_path = vim.fn.stdpath("data") --[[@as string]]
local state_path = vim.fn.stdpath("state") --[[@as string]]

---Execute git command in given directory synchronously
---@param path string
---@param cmd string[] git command to execute
---@param error_lev number? log level to use for errors, hide errors if nil or false
---@reurn { success: boolean, output: string }
function M.git_dir_execute(path, cmd, error_lev)
    local shell_args = { "git", "-C", path, unpack(cmd) }
    local shell_out = vim.fn.system(shell_args)
    if vim.v.shell_error ~= 0 then
        if error_lev then
            M.error(shell_args, shell_out, error_lev)
        end
        return {
            success = false,
            output = shell_out,
        }
    end
    return {
        success = true,
        output = shell_out,
    }
end

function M.apply_patches()
    vim.g.package_path = vim.fs.joinpath(data_path, "lazy")
    vim.g.package_lock = vim.fs.joinpath(conf_path, "lazy-lock.json")
    vim.api.nvim_create_autocmd("User", {
        desc = "Reverse/Apply local patches on updating/intalling plugins.",
        group = vim.api.nvim_create_augroup("LazyPatches", {}),
        pattern = {
            "LazyInstall*",
            "LazyUpdate*",
            "LazyRestore*",
        },
        callback = function(info)
            local patches_path = vim.fs.joinpath(conf_path, "patches")
            for patch in vim.fs.dir(patches_path) do
                local patch_path = vim.fs.joinpath(patches_path, patch)
                local plugin_path = vim.fs.joinpath(vim.g.package_path, (patch:gsub("%.patch$", "")))
                if vim.uv.fs_stat(plugin_path) then
                    M.git_dir_execute(plugin_path, {
                        "restore",
                        ".",
                    })
                    if not info.match:find("Pre$") then
                        vim.notify("[packages] applying patch " .. patch)
                        M.git_dir_execute(plugin_path, {
                            "apply",
                            "--ignore-space-change",
                            patch_path,
                        }, vim.log.levels.WARN)
                    end
                end
            end
        end,
    })
end

return M
