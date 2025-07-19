return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {},
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },

{
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
},

{
  "saghen/blink.cmp",
  version = "1.*",
  opts = {
    keymap = { preset = "default" },
    appearance = { nerd_font_variant = "mono" },
    completion = { documentation = { auto_show = false } },
    sources = { default = { "lsp", "path", "buffer" } },
    fuzzy = {
      implementation = "prefer_rust_with_warning",
      sorts = {
        "kind",       -- sort by numeric kind first (functions kind=3, so they get priority)
        "score",      -- then sort by fuzzy score
        "sort_text",  -- then sort by sortText field
        "label",      -- finally by label to tie-break
      },
    },
  },
}
}
