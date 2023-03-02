-- Override default_config.lua
local M = {}
M.options, M.ui, M.mappings, M.plugins = {}, {}, {}, {}

M.plugins = require "custom.plugins"
M.mappings = require "custom.mappings"

M.ui = {
    theme = "chadracula"
}

return M
