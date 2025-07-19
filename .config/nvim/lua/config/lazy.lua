-- Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local output = vim.fn.system({
    "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_err_writeln("Failed to clone lazy.nvim:\n" .. output)
    vim.api.nvim_err_writeln("Press any key to exit...")
    vim.fn.getchar()
    os.exit(1)
  end
end

-- Prepend lazy.nvim to runtime path
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- Import your plugins here
    { import = "plugins" },
  },
  install = {
    colorscheme = { "habamax" }, -- colorscheme to use during install
  },
  checker = {
    enabled = false, -- disable automatic plugin update checks
  },
})
