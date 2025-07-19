return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    lazy = true,
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    opts = {
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    },
  },

{
  "nvim-tree/nvim-tree.lua",
  lazy = true,
  cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    update_focused_file = {
      enable = true,
      update_root = {
        enable = true,
      },
    },
  },
},

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    lazy = true,
    cmd = { "HarpoonAdd", "HarpoonToggle", "HarpoonMenu" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  {
    "lmburns/lf.nvim",
    lazy = true,
    cmd = "Lf",
    dependencies = { "akinsho/toggleterm.nvim" },
    opts = {
      escape_quit = false,
      border = "rounded",
    },
  },

  {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
      },
    },
  },
}

