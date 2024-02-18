return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "phpmd",
        "phpstan",
        "php-debug-adapter",
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "php", "phpdoc", "twig" })
      end

      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {},
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      php_cs_fixer = {
        command = "vendor/bin/php-cs-fixer",
        args = { "--no-interaction", "fix", "$FILENAME" },
        env = {
          PHP_CS_FIXER_IGNORE_ENV = "1",
        },
      },
      formatters_by_ft = {
        php = { "php_cs_fixer", "pint" },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      phpmd = {
        args = { "-", "json", "phpmd.xml" },
      },
      linters_by_ft = {
        -- php = { "phpmd", "phpstan" },
      },
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "theutz/neotest-pest",
    },
    opts = {
      adapters = {
        ["neotest-pest"] = {},
      },
    },
  },
}
