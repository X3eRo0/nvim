local ts = vim.treesitter
local start = ts.start

local function is_parser_error(err)
    err = tostring(err)

    return err:find("Query error", 1, true) ~= nil
        or err:find("Invalid field name", 1, true) ~= nil
        or err:find("Invalid node type", 1, true) ~= nil
        or err:find("no parser for language", 1, true) ~= nil
end

ts.start = function(bufnr, lang)
    local ok, result = pcall(start, bufnr, lang)
    if ok then
        return result
    end

    if is_parser_error(result) then
        return nil
    end

    error(result)
end
