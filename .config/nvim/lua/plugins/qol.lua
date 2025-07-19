return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  {
    "echasnovski/mini.trailspace",
    version = "*",
    opts = {},
  },

  {
    "echasnovski/mini.splitjoin",
    version = "*",
    opts = {},
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    ft = { "markdown" },
    opts = {},
  },
}
