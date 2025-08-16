-- Highlight when yanking (copying) text
-- To test, use `yap` in `normal` mode
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Autoformat PHP files on save using PHPCBF
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.php",
  desc = "Autoformat PHP files on save using PHPCBF",
  callback = function()
    require("conform").format()
  end,
})
