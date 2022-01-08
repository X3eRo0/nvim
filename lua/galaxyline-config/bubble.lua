-- Plugin configuration: galaxyline
-- =============================================================================

-- =============================================================================
--                              Helper functions
-- =============================================================================

local cursor_position = function()
  local current_line = vim.fn.line('.')
  local current_col = vim.fn.virtcol('.')
  return current_line .. ':' .. current_col
end

local cursor_position_perc = function()
  local current_line = vim.fn.line('.')
  local num_lines = vim.fn.line('$')

  if current_line == 1 then
    return 'Top'
  elseif current_line == num_lines then
    return 'Bot'
  else
    local perc = math.floor(current_line / num_lines * 100)
    return string.format("%2d",  perc) .. '%'
  end
end

local check_width = function()
  if vim.fn.winwidth(0) > 80 then
    return true
  end
  return false
end

-- =============================================================================
--                              Custom providers
-- =============================================================================

-- local weather = require('weather')

-- =============================================================================
--                          galaxyline configuration
-- =============================================================================

local gl = require('galaxyline')
local condition = require('galaxyline.condition')
local gls = gl.section

-- Color definition
-- -----------------------------------------------------------------------------
local colors  = {
  bg          = '#2d323b',
  section_bg  = '#3e4452',
  fg          = '#abb2bf',
  aqua        = '#8ec07c',
  black       = '#333841',
  blue        = '#61afef',
  dark_blue   = '#528bff',
  cyan        = '#8abeb7',
  dark_cyan   = '#80a0ff',
  green       = '#98c379',
  dark_green  = '#50a14f',
  grey        = '#636d83',
  magenta     = '#ff80ff',
  orange      = '#d19a66',
  dark_orange = '#c18401',
  purple      = '#a626a4',
  red         = '#e88388',
  dark_red    = '#e06c75',
  violet      = '#b294bb',
  white       = '#f2e5bc',
  yellow      = '#e5c07b',
  dark_yellow = '#986801',
}

-- Map that convert mode identification (see `:help modes()`) to a name and
-- color.
local mode_map = {
  ['n']  = {'NORMAL',   colors.blue},
  ['i']  = {'INSERT',   colors.green},
  ['R']  = {'REPLACE',  colors.red},
  ['v']  = {'VISUAL',   colors.magenta},
  ['V']  = {'V-LINE',   colors.magenta},
  [''] = {'V-BLOCK',  colors.violet},
  ['s']  = {'SELECT',   colors.yellow},
  ['S']  = {'S-LINE',   colors.orange},
  [''] = {'S-BLOCK',  colors.dark_yellow},
  ['c']  = {'COMMAND',  colors.orange},
  ['t']  = {'TERMINAL', colors.grey},
  ['Rv'] = {'VIRTUAL',  colors.red},
  ['rm'] = {'--MORE',   colors.cyan},
  -- Fallback mode.
  ['fallback'] = {'UNKNOWN', colors.blue}
}

-- Return the highlight color of the current mode.
local function mode_hl()
  local mode = mode_map[vim.fn.mode()]

  -- Fallback color is a mode is not available in `mode_map`.
  if mode == nil then
    mode = mode_map['n']
    return mode[2]
  end
  return mode[2]
end

-- Return the current mode name.
local function mode_name()
  local mode = mode_map[vim.fn.mode()]

  -- Fallback if a mode is not available in `mode_map`.
  if mode == nil then
    str = mode_map['n'][1]
  else
    str = mode[1]
  end

  -- Make the string size constant.
  local mode_len = string.len(str)
  local delta = math.floor((8 - mode_len)/2)
  local str = string.rep(" ", delta) .. str .. string.rep(" ", 8 - mode_len - delta)
  return str
end

--                                 Left part
-- -----------------------------------------------------------------------------

-- Vim mode
-- --------

gls.left[1] = {
  ViMode = {
    provider = function()
      vim.api.nvim_command('hi GalaxyViMode guifg=' .. mode_hl())
      return '█' .. ' ' .. mode_name()
    end,
    highlight = {colors.fg, colors.section_bg},
  }
}

-- Macros
-- ------

gls.left[2] = {
  Macro = {
    provider = function()
      local reg = vim.fn.reg_recording()

      if (reg == nil) or (reg == '') then
        return ''
      else
        return '   ' .. vim.call('reg_recording')
      end
    end,
    highlight = {colors.red, colors.section_bg},
  }
}

-- File icon
-- ---------

gls.left[3] = {
  FileIcon = {
    provider = {
      function() return '  ' end,
      'FileIcon'
    },
    condition = condition.buffer_not_empty,
    highlight = {
      require('galaxyline.provider_fileinfo').get_file_icon,
      colors.section_bg
    }
  }
}

-- File name
-- ---------

gls.left[4] = {
  FileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg, colors.section_bg}
  },
}

-- Section separator
-- -----------------

gls.left[5] = {
  SectionSeparatorMarker = {
    provider = function() return '' end,
    highlight = {colors.section_bg, colors.bg},
  },
}

gls.left[6] = {
  SectionSeparator = {
    provider = function() return ' ' end,
    highlight = {colors.fg, colors.bg},
  },
}

--                                 Middle part
-- -----------------------------------------------------------------------------

-- Git status
-- ----------

gls.left[7] = {
  GitIcon = {
    provider = function()
      return '  '
    end,
    condition = condition.check_git_workspace,
    highlight = {colors.orange, colors.bg},
    separator = ' ',
    separator_highlight = {colors.orange, colors.bg},
  }
}

gls.left[8] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = condition.check_git_workspace,
    highlight = {colors.fg, colors.bg, 'bold'},
    separator = ' ',
    separator_highlight = {colors.orange, colors.bg},
  }
}

gls.left[9] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    highlight = {colors.green, colors.bg},
    icon = '+',
  }
}

gls.left[10] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    highlight = {colors.orange, colors.bg},
    icon = '~',
  }
}

gls.left[11] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    highlight = {colors.red, colors.bg},
    icon = '-',
  }
}

--                                 Right part
-- -----------------------------------------------------------------------------

gls.right[1] = {
  CursorPosition = {
    provider = {
      function() return '﫦' end,
      cursor_position
    },
    highlight = {colors.fg, colors.bg},
  }
}

gls.right[2] = {
  FileEncode = {
    provider = {
      'FileEncode',
      function() return ' ' end
    },
    highlight = {colors.fg, colors.bg},
    separator = ' |',
    separator_highlight = {colors.fg, colors.bg}
  }
}

gls.right[3] = {
  FileSize = {
    condition = function()
      return require('galaxyline.provider_fileinfo').get_file_size() ~= ''
    end,
    provider = {function() return ' ' end, 'FileSize'},
    highlight = {colors.fg, colors.bg},
    separator = '|',
    separator_highlight = {colors.fg, colors.bg}
  }
}

gls.right[4] = {
  Separator = {
    provider = function() return '' end,
    highlight = {colors.section_bg, colors.bg},
  }
}

-- gls.right[5] = {
--   WeatherCondition = {
--     provider = function()
--       return weather.get_condition_icon()
--     end,
--     condition = check_width,
--     event = 'WeatherUpdated',
--     highlight = {colors.fg, colors.section_bg},
--     separator = ' ',
--     separator_highlight = {colors.fg, colors.section_bg},
--   }
-- }

-- gls.right[6] = {
--   WeatherTemp = {
--     provider = function()
--       return weather.get_temp()
--     end,
--     condition = check_width,
--     event = 'WeatherUpdated',
--     highlight = 'WeatherTemp',
--     separator = '  ',
--     separator_highlight = {colors.fg, colors.section_bg},
--   }
-- }
-- 
-- gls.right[7] = {
--   WeatherMaxTempIcon = {
--     provider = function()
--       return 'ﰵ'
--     end,
--     condition = check_width,
--     highlight = {colors.red, colors.section_bg},
--     separator = ' ',
--     separator_highlight = {colors.fg, colors.section_bg},
--   }
-- }
-- 
-- gls.right[8] = {
--   WeatherMaxTemp = {
--     provider = function()
--       return weather.get_max_temp()
--     end,
--     condition = check_width,
--     event = 'WeatherUpdated',
--     highlight = 'WeatherMaxTemp',
--     separator = ' ',
--     separator_highlight = {colors.fg, colors.section_bg},
--   }
-- }
-- 
-- gls.right[9] = {
--   WeatherMinTempIcon = {
--     provider = function()
--       return ''
--     end,
--     condition = check_width,
--     highlight = {colors.blue, colors.section_bg},
--     separator = ' ',
--     separator_highlight = {colors.fg, colors.section_bg},
--   }
-- }
-- 
-- gls.right[10] = {
--   WeatherMinTemp = {
--     provider = function()
--       return weather.get_min_temp()
--     end,
--     condition = check_width,
--     event = 'WeatherUpdated',
--     highlight = 'WeatherMinTemp',
--     separator = ' ',
--     separator_highlight = {colors.fg, colors.section_bg},
--   }
-- }
-- 
-- gls.right[11] = {
--   WeatherSeparator = {
--     provider = function()
--       return '|'
--     end,
--     condition = check_width,
--     highlight = {colors.fg, colors.section_bg},
--     separator = ' ',
--     separator_highlight = {colors.fg, colors.section_bg}
--   }
-- }

gls.right[12] = {
  CursorPerc = {
    provider = {
      cursor_position_perc,
      function() return ' ' end
    },
    highlight = {colors.fg, colors.section_bg},
    separator = ' ',
    separator_highlight = {colors.fg, colors.section_bg}
  }
}

--                                 Short line
-- -----------------------------------------------------------------------------

gl.short_line_list = {'NvimTree', 'vista', 'dbui', 'packer'}

-- Separator
-- ---------

gls.short_line_left[1] = {
  ShortLineSeparator = {
    provider = function() return ' ' end,
    highlight = {colors.section_bg, colors.section_bg},
  }
}

-- File type name
-- --------------

gls.short_line_left[2] = {
  ShortLineFileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg, colors.section_bg},
    separator = '',
    separator_highlight = {colors.section_bg, colors.bg}
  },
}

-- Buffer icon
-- -----------

gls.short_line_right[1] = {
  BufferIcon = {
    provider = 'BufferIcon',
    highlight = {colors.fg, colors.bg}
  }
}
