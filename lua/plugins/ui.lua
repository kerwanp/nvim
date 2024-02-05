return {
  { "nyoom-engineering/oxocarbon.nvim" },
  {
    "lazyvim/lazyvim",
    opts = {
      colorscheme = "oxocarbon",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        section_separators = { left = "", right = "" },
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
      { "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
    },
  },
}
