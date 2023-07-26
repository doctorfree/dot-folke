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

-- require("util.profiler").start()

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimStarted",
  callback = function()
    vim.schedule(function()
      -- require("util.profiler").stop()
    end)
  end,
})

-- vim.g.profile_loaders = true
require("config.lazy")

-- require("util.dashboard").setup()

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("config.env")
    require("util").version()
  end,
})
