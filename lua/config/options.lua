vim.o.guifont = "GeistMono Nerd Font:h18"

vim.filetype.add({ extension = { templ = "templ" } })
vim.filetype.add({
  extension = {
    mdx = "mdx",
  },
})
vim.filetype.add({ extension = { edge = "html" } })

vim.g.lazyvim_php_lsp = "intelephense"
