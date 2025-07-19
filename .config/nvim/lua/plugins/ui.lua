return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "tokyonight",
        always_show_tabline = false,
        section_separators = "",
        component_separators = "",
        disabled_filetypes = {
          statusline = { "alpha", "oil" },
          winbar = {},
        },
      },
      tabline = {
        lualine_a = {
          {
            "tabs",
            mode = 2,
            max_length = vim.o.columns,
            tabs_color = {
              active = "lualine_a_normal",
              inactive = "lualine_a_inactive",
            },
            fmt = function(name)
              return name:gsub("%s+", "")
            end,
          },
        },
      },
      extensions = {
        {
          filetypes = { "alpha" },
          sections = {},
          inactive_sections = {},
        },
      },
    },
    config = function(_, opts)
      require("lualine").setup(opts)
    end,
  },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "storm",
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight")
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
  },

  {
    "goolord/alpha-nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
        "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
        "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
        "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
        "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
        "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
      }

      dashboard.section.buttons.val = {
        dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
        dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
        dashboard.button("n", "  New File", ":ene <BAR> startinsert <CR>"),
        dashboard.button("q", "  Quit", ":qa<CR>"),
      }

      dashboard.section.footer.val = ""

      alpha.setup(dashboard.config)
    end,
  },
}
