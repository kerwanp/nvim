return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")

      local snip_status_ok, luasnip = pcall(require, "luasnip")

      if not snip_status_ok then
        return
      end

      local function has_words_before()
        local line, col = (unpack or table.unpack)(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      opts.window = {
        completion = cmp.config.window.bordered({
          winhighlight = opts.winhighlight or "Normal:Normal,FloatBorder:FloatBoarder,CursorLine:Visual,Search:None",
        }),
        documentation = cmp.config.window.bordered({
          winhighlight = opts.winhighlight or "Normal:Normal,FloatBorder:FloatBoarder,CursorLine:Visual,Search:None",
        }),
      }

      opts.preselect = cmp.PreselectMode.None

      opts.completion = {
        completopt = "menu,menuone,noselect",
      }

      opts.confirm_opts = {
        confirm_opts = {
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        },
      }

      opts.mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })

      return opts
    end,
  },
  {
    "echasnovski/mini.comment",
    opts = {
      mappings = {
        comment_line = "<leader>/",
        comment_visual = "<leader>/",
      },
    },
  },
}
