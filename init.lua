if vim.env.VSCODE then
  vim.g.vscode = true
end

-- vim.loader = false
if vim.loader then
  vim.loader.enable()
  vim.schedule(function()
    vim.notify("nvim loader is enabled")
  end)
end

_G.dd = function(...)
  require("util.debug").dump(...)
end
vim.print = _G.dd

-- vim.g.profile_loaders = true
require("config.lazy")

-- require("util.dashboard").setup()
