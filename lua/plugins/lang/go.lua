return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "css", "scss", "html" })
      end
    end,
  },
  {

    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ccls = {},
        cmake = {},
        templ = {},
      },
    },
  },
}
