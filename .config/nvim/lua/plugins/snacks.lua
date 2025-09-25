return {
  "folke/snacks.nvim",
  config = function(_, opts)
    require("snacks").setup(opts)

    -- MonkeyPatch - https://github.com/folke/snacks.nvim/pull/2012
    local M = require("snacks.picker.core.main")

    M.new = function(opts)
      opts = vim.tbl_extend("force", {
        float = false,
        file = true,
        current = false,
      }, opts or {})

      local self = setmetatable({}, M)
      self.opts = opts
      self.win = vim.api.nvim_get_current_win()

      return self
    end
  end,
}
