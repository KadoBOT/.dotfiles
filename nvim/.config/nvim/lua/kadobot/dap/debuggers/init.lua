local M = {}

local ts = require("kadobot.dap.debuggers.typescript")

return vim.tbl_deep_extend("force", M, ts)
