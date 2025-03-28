local cmp_ok, cmp = pcall(require, "cmp_nvim_lsp")

if not cmp_ok then
    return
end

local M = {}

local capabilities = cmp.default_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}
M.capabilities = capabilities

M.on_attach = function(client, _)
    if client.server_capabilities.inlayHintProvider then
        -- enables inline type hints for all function arguments
        -- vim.lsp.inlay_hint.enable(true)
    end
end

return M
