vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', {
  noremap = true,
  silent = true,
  desc = 'Find Files with Telescope'
})

vim.keymap.set('n', '<leader>nt', ':lua require("nvim-tree.api").tree.toggle({ focus = false })<CR>', {
  noremap = true,
  silent = true,
  desc = 'Toggle NvimTree without focus'
})


vim.keymap.set('n', '<leader>lf', ':Lf<CR>', {
  noremap = true,
  silent = true,
  desc = 'Open LF File Manager'
})

vim.keymap.set('n', '<leader>pm', ':Lazy<CR>', {
  noremap = true,
  silent = true,
  desc = 'Open Plugin Manager'
})

vim.keymap.set('n', '<Space><Tab>', ':tabnext<CR>', {
  noremap = true,
  silent = true,
  desc = 'Go to next tab'
})

vim.keymap.set('n', '<Space><S-Tab>', ':tabprevious<CR>', {
  noremap = true,
  silent = true,
  desc = 'Go to previous tab'
})

vim.keymap.set('n', '<leader>h', '<C-w>h', {
  noremap = true,
  silent = true,
  desc = 'Move to left window'
})

vim.keymap.set('n', '<leader>l', '<C-w>l', {
  noremap = true,
  silent = true,
  desc = 'Move to right window'
})

vim.keymap.set('n', '<leader>j', '<C-w>j', {
  noremap = true,
  silent = true,
  desc = 'Move to bottom window'
})

vim.keymap.set('n', '<leader>k', '<C-w>k', {
  noremap = true,
  silent = true,
  desc = 'Move to top window'
})


local Terminal = require("toggleterm.terminal").Terminal
local test_term = nil
local parameters = ""
local last_script_path = nil

-- Helper to show notifications
local function notify(msg, level)
  vim.notify(msg, level or vim.log.levels.INFO, { title = "ToggleTerm Python" })
end

-- Create or toggle the Python terminal
local function toggle_test_terminal()
  local script_path = vim.fn.expand("%:p")

  if not script_path:match("%.py$") then
    notify("Current file is not a Python script.", vim.log.levels.WARN)
    return
  end

  if vim.bo.modified then
    notify("Buffer not saved. Please save the file before running.", vim.log.levels.WARN)
    return
  end

  last_script_path = script_path

  local cmd = "python3 " .. vim.fn.shellescape(script_path) .. " " .. parameters

  -- Reuse terminal if exists
  if test_term then
    test_term.cmd = cmd
  else
    test_term = Terminal:new({
      cmd = cmd,
      direction = "horizontal",
      close_on_exit = false,
      hidden = true,
    })
  end

  test_term:toggle()
end

-- Command to set parameters
vim.api.nvim_create_user_command("Parameters", function(opts)
  parameters = opts.args or ""
  notify("Parameters set to: " .. parameters)
end, {
  nargs = "*",
  desc = "Set parameters for Python script",
})

-- Optional: clear/reset parameters
vim.api.nvim_create_user_command("ClearParameters", function()
  parameters = ""
  notify("Parameters cleared.")
end, {
  desc = "Clear parameters for Python script",
})

-- Keymap to toggle the test terminal
vim.keymap.set("n", "<leader>t", toggle_test_terminal, {
  desc = "Toggle terminal and run current Python script",
})

