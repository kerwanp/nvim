return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.filesystem.bind_to_cwd = true
    end,
    keys = {
      {
        "<leader>e",
        function()
          if vim.bo.filetype == "neo-tree" then
            vim.cmd.wincmd("p")
          else
            vim.cmd.Neotree("focus")
          end
        end,
        desc = "Focus explorer",
      },
      {
        "<leader>o",
        "<cmd>Neotree toggle<cr>",
        desc = "Toggle explorer",
      },
    },
  },
  {
    "echasnovski/mini.bufremove",
    keys = {
      {
        "<leader>x",
        function()
          local bd = require("mini.bufremove").delete
          if vim.bo.modified then
            local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
            if choice == 1 then -- Yes
              vim.cmd.write()
              bd(0)
            elseif choice == 2 then -- No
              bd(0, true)
            end
          else
            bd(0)
          end
        end,
        desc = "Delete Buffer",
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    keys = {
      { "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>/", false },
    },
  },
  {
    "folke/todo-comments.nvim",
    keys = {
      { "<leader>xt", false },
      { "<leader>xT", false },
    },
  },
  -- TODO: Remap those
  {
    "folke/trouble.nvim",
    keys = {
      { "<leader>xx", false },
      { "<leader>xX", false },
      { "<leader>xL", false },
      { "<leader>xQ", false },
    },
  },
}
