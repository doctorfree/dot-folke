local use_dev = false

if use_dev then
  vim.opt.runtimepath:prepend(vim.fn.expand("~/projects/lazy.nvim"))
else
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)
end

require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.linting.eslint" },
    -- { import = "lazyvim.plugins.extras.formatting.prettier" },
    { import = "lazyvim.plugins.extras.coding.copilot" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.rust" },
    { import = "lazyvim.plugins.extras.lang.tailwind" },
    { import = "lazyvim.plugins.extras.ui.mini-animate" },
    { import = "lazyvim.plugins.extras.ui.edgy" },
    { import = "lazyvim.plugins.extras.dap.core" },
    { import = "lazyvim.plugins.extras.vscode" },
    { import = "lazyvim.plugins.extras.dap.nlua" },
    { import = "lazyvim.plugins.extras.util.mini-hipatterns" },
    { import = "lazyvim.plugins.extras.test.core" },
    { import = "lazyvim.plugins.extras.editor.flash" },
    { import = "lazyvim.plugins.extras.coding.yanky" },
    { import = "lazyvim.plugins.extras.editor.mini-files" },
    -- { import = "lazyvim.plugins.extras.util.project" },
    { import = "plugins" },
  },
  defaults = { lazy = true },
  install = { colorscheme = { "tokyonight", "habamax" }, missing = true },
  checker = { enabled = true },
  diff = {
    cmd = "terminal_git",
  },
  performance = {
    cache = {
      enabled = true,
      -- disable_events = {},
    },
    rtp = {
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        "netrwPlugin",
        "rplugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  ui = {
    size = { width = 0.8, height = 0.6 },
    border = "rounded",
    custom_keys = {
      ["<localleader>d"] = function(plugin)
        dd(plugin)
      end,
    },
  },
  debug = false,
})
