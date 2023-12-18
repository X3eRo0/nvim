local fn = vim.fn
local api = vim.api
local hls = require("utils.highlights")

local M = {}

-- possible values are 'arrow' | 'rounded' | 'blank'
local active_sep = "blank"

-- change them if you want to different separator
M.separators = {
    arrow = { "", "" },
    rounded = { "", "" },
    blank = { "", "" },
}

-- highlight groups
M.colors = {
    active = "%#StatusLine#",
    inactive = "%#StatuslineNC#",
    git = "%#Git#",
    git_alt = "%#GitAlt#",
    filetype = "%#Filetype#",
    filetype_alt = "%#FiletypeAlt#",
    line_col = "%#LineCol#",
    line_col_alt = "%#LineColAlt#",
}

M.trunc_width = setmetatable({
    git_status = 90,
    filename = 140,
    line_col = 60,
}, {
    __index = function()
        return 80
    end,
})

M.is_truncated = function(_, width)
    local current_width = api.nvim_win_get_width(0)
    return current_width < width
end

M.get_lsp_client = function()
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
        return ""
    end
    return clients[1].name
end

M.get_git_lsp_status = function(self)
    -- use fallback because it doesn't set this variable on the initial `BufEnter`
    local signs = vim.b.gitsigns_status_dict or { head = "", added = 0, changed = 0, removed = 0 }
    local lsp = M.get_lsp_client()
    local is_head_empty = signs.head ~= ""

    if self:is_truncated(self.trunc_width.git_status) then
        return is_head_empty and string.format("[%s, %s] ", signs.head or "", lsp or "") or "%="
    end

    -- return is_head_empty
    --         and string.format("%%=[%s] +%s,~%s,-%s [%s] ", signs.head, signs.added, signs.changed, signs.removed, lsp)
    --     or "%="
    return is_head_empty
            and string.format(
                "[%s] +%s,~%s,-%s [%s] ",
                hls.hl(signs.head, "GitCommitBranch"),
                hls.hl(signs.added, "GitSignsAdd"),
                hls.hl(signs.changed, "GitSignsChange"),
                hls.hl(signs.removed, "GitSignsDelete"),
                lsp
            )
        or ""
end

M.get_filename = function(self)
    if self:is_truncated(self.trunc_width.filename) then
        local filename = string.format("%s", hls.hl("%<%f", "Bold")) .. " %m%r%h%w%q "
        -- return "%<%f %m%r "
        return filename
    end
    local filename = string.format("%s", hls.hl("%<%F", "Bold")) .. " %m%r%h%w%q "
    -- return "%<%F %m%r "
    return filename
end

M.get_filetype = function()
    return "%y "
end

M.get_line_col = function()
    return "%04l,%04c "
end

M.get_lines_and_size = function()
    return "%LL,%{line2byte('$')}B "
end

M.get_percentage = function()
    return "%p%%"
end

M.set_active = function(self)
    local colors = self.colors

    local filename = colors.active .. self:get_filename()
    local filetype = colors.filetype .. self:get_filetype()
    local git = colors.git .. self:get_git_lsp_status() .. self.separators[active_sep][1]
    local line_col = colors.line_col .. self:get_line_col()
    local line_size = colors.line_col .. self:get_lines_and_size() .. self.separators[active_sep][2]

    -- Calculate available space on both sides of the git status
    local total_width = api.nvim_win_get_width(0)
    local git_width = vim.fn.strdisplaywidth(self:get_git_lsp_status())
    local remaining_width = string.len(tostring(vim.fn.line2byte(vim.fn.line("$") + 1)))
        + 15
        + string.len(vim.fn.line("$"))
    local percentage = M.get_percentage()
    -- vim.print(string.format("%s, %d", "total", total_width))
    -- vim.print(string.format("%s, %d", self:get_git_lsp_status(), git_width))
    -- vim.print(string.format("%s, %d", self:get_line_col() .. self:get_lines_and_size(), remaining_width))

    -- Distribute space evenly on both sides
    -- local num = math.floor(total_width / 2) - remaining_width - math.floor(git_width / 2)
    -- local padding = string.rep(" ", num)

    return table.concat({
        colors.active,
        git,
        "%=",
        filename,
        filetype,
        "%=",
        line_col,
        line_size,
        percentage,
    })
end

M.set_inactive = function(self)
    return self.colors.inactive .. "%F"
end

Statusline = setmetatable(M, {
    __call = function(statusline, mode)
        if mode == "active" then
            return statusline:set_active()
        end
        if mode == "inactive" then
            return statusline:set_inactive()
        end
    end,
})

-- set statusline
-- TODO: replace this once we can define autocmd using lua
vim.cmd([[
    augroup Statusline
    au!
    au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline('active')
    au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline('inactive')
    augroup END
]])
