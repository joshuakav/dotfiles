vim.opt.number = true
vim.opt.wrap = false
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.o.termguicolors = true  -- helps with modern terminals
vim.o.clipboard = "unnamedplus"

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local function paste()
  return {
    vim.fn.split(vim.fn.getreg(""), "\n"),
    vim.fn.getregtype(""),
  }
end

local osc52 = require("vim.ui.clipboard.osc52")

vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = function(lines, _)
      osc52.copy("+")(lines)
    end,
    ["*"] = function(lines, _)
      osc52.copy("*")(lines)
    end,
  },
  paste = {
    ["+"] = paste,
    ["*"] = paste,
  },
}


-- Auto-save folds when leaving a buffer, and load them when entering
vim.api.nvim_create_autocmd("BufWinLeave", {
  pattern = "*",
  callback = function()
    vim.cmd("silent! mkview")
  end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  callback = function()
    vim.cmd("silent! loadview")
  end,
})

