-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local opts = {noremap = true, silent = true}

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "gdp", "<cmd>Lspsaga preview_definition<CR>", opts)
    buf_set_keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "<space>rn", "<cmd>Lspsaga rename<CR>", opts)
    buf_set_keymap("n", "<space>ca", "<cmd>Lspsaga code_action<CR>", opts)
    buf_set_keymap("v", "<space>ca", ":<C-U>Lspsaga range_code_action<CR>", opts)
    -- buf_set_keymap("n", "<space>ca", "<cmd>CodeActionMenu<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
    buf_set_keymap("n", "<space>de", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
    buf_set_keymap("n", "<C-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)
    buf_set_keymap("n", "<C-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)
    -- buf_set_keymap(
    --     "n",
    --     "<space>f",
    --     "<cmd>lua vim.lsp.buf.formatting({tabSize=4, insertSpaces=true, trimTrailingWhitespace=true})<CR>",
    --     opts
    -- )
    -- buf_set_keymap(
    --     "n",
    --     "<leader>de",
    --     "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = border })<CR>",
    --     opts
    -- )
    -- buf_set_keymap("n", "[d", '<Cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {source = "always"}})<CR>', opts)
    -- buf_set_keymap("n", "]d", '<Cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {source = "always"}})<CR>', opts)
end

local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(
    function(server)
        local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
        local opts = {
            on_attach = on_attach,
            capabilities = capabilities,
            flags = {
                debounce_text_changes = 150
            }
        }
        if server.name == "sumneko_lua" then
            opts =
                vim.tbl_deep_extend(
                "force",
                {
                    settings = {
                        Lua = {
                            runtime = {version = "LuaJIT", path = vim.split(package.path, ";")},
                            diagnostics = {globals = {"vim"}},
                            workspace = {library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false},
                            telemetry = {enable = false}
                        }
                    }
                },
                opts
            )
        end
        server:setup(opts)
    end
)

-- vim.lsp.handlers["textDocument/definition"] = goto_definition("vsplit")
