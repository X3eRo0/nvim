-- vim.cmd([[autocmd ColorScheme * highlight NormalFloat guibg=#1f2335]])
-- vim.cmd([[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])
--
-- local border = {
--     { "┌", "FloatBorder" },
--     { "─", "FloatBorder" },
--     { "┐", "FloatBorder" },
--     { "│", "FloatBorder" },
--     { "┘", "FloatBorder" },
--     { "─", "FloatBorder" },
--     { "└", "FloatBorder" },
--     { "│", "FloatBorder" },
-- }
--
-- local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
-- function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
--     opts = opts or {}
--     opts.border = opts.border or border
--     return orig_util_open_floating_preview(contents, syntax, opts, ...)
-- end

local M = {}

local function setup_diags()
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    vim.diagnostic.config({
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = signs.Error,
                [vim.diagnostic.severity.WARN] = signs.Warn,
                [vim.diagnostic.severity.HINT] = signs.Hint,
                [vim.diagnostic.severity.INFO] = signs.Info,
            },
        },
        virtual_text = false,
        update_in_insert = true,
        underline = false,
        severity_sort = true,
        float = {
            focusable = true,
            style = "minimal",
            border = "rounded",
            header = "",
            prefix = "",
        },
    })

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        -- virtual_text = {
        --     spacing = 5,
        --     severity_limit = "Warning",
        -- },
        update_in_insert = true,
        underline = false,
        virtual_text = false,
    })
    -- _G.LspDiagnosticsShowPopup = function()
    --     return vim.diagnostic.open_float(0, { scope = "cursor" })
    -- end
end
-- -- Show diagnostics in a pop-up window on hover
-- _G.LspDiagnosticsPopupHandler = function()
--     local current_cursor = vim.api.nvim_win_get_cursor(0)
--     local last_popup_cursor = vim.w.lsp_diagnostics_last_cursor or { nil, nil }
--
--     -- Show the popup diagnostics window,
--     -- but only once for the current cursor location (unless moved afterwards).
--     if not (current_cursor[1] == last_popup_cursor[1] and current_cursor[2] == last_popup_cursor[2]) then
--         vim.w.lsp_diagnostics_last_cursor = current_cursor
--         vim.diagnostic.open_float(0, { scope = "cursor" }) -- for neovim 0.6.0+, replaces show_{line,position}_diagnostics
--     end
-- end

function M.setup()
    setup_diags()
end

return M
