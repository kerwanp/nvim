return {
  { import = "lazyvim.plugins.extras.lang.markdown" },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {})
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      vim.treesitter.language.register("markdown", "mdx")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        mdx_analyzer = {},
      },
    },
  },
}
