local lspservers = { "pyright", "lua_ls", "html" , "cssls", "jsonls", "bashls" }
local function make_lsp_servers_list(server_names)
  local servers = {}
  for _, name in ipairs(server_names) do
    servers[name] = {}
  end
  return servers
end
local servers_opts = make_lsp_servers_list(lspservers)
return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = lspservers,
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    opts = {
      servers = servers_opts,
    },
    config = function(_, opts)
      local lspconfig = require("lspconfig")
      local blink = require("blink.cmp")

      local base_capabilities = blink.get_lsp_capabilities()

      for server, server_opts in pairs(opts.servers) do
        server_opts.capabilities = blink.get_lsp_capabilities(server_opts.capabilities or base_capabilities)
        lspconfig[server].setup(server_opts)
      end
    end,
  },
}
