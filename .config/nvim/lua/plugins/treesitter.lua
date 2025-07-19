return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = { "python", "lua", "html", "css", "json", "bash" },
    auto_install = true,
  },
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
  end,
}
