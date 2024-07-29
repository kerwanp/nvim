return {
  {
    "neovim/nvim-lspconfig",
    version = "*",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "<leader>la", vim.lsp.buf.code_action, desc = "Code Action" }
      keys[#keys + 1] = { "<leader>lr", vim.lsp.buf.rename, desc = "Rename", has = "rename" }
    end,
    opts = {
      servers = {
        biome = {},
      },
      inlay_hints = {
        enabled = false,
      },
      setup = {
        rust_analyzer = function()
          return true
        end,
      },
    },
  },
}
