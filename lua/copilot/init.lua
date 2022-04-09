local M = {}

local defaults = {
  plugin_manager_path = vim.fn.stdpath("data") .. "/site/pack/packer",
  on_attach = function()
    require("copilot_cmp")._on_insert_enter()
  end,
}

local config_handler = function(opts)
  local user_config = opts and vim.tbl_deep_extend("force", defaults, opts) or defaults
  return user_config
end

M.setup = function(opts)
  local user_config = config_handler(opts)
  require("copilot.copilot_handler").start(user_config)
end

return M
