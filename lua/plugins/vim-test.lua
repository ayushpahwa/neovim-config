return {
  "vim-test/vim-test",
  dependencies = {
    "preservim/vimux",
  },
  init = function()
    vim.cmd "let test#strategy='vimux'"
  end,
  keys = {
    {
      "<leader>tn",
      ":TestNearest<Return>",
      silent = true,
      noremap = true,
      desc = "Run the nearest test func",
    },
    {
      "<leader>tf",
      ":TestFile<Return>",
      silent = true,
      noremap = true,
      desc = "Run the whole test file",
    },
    {
      "<leader>ts",
      ":TestSuite<Return>",
      silent = true,
      noremap = true,
      desc = "Run the full test suite",
    },
    {
      "<leader>tl",
      ":TestLast<Return>",
      silent = true,
      noremap = true,
      desc = "Run the last test",
    },
    {
      "<leader>tg",
      ":TestVisit<Return>",
      silent = true,
      noremap = true,
      desc = "View the test results",
    },
  },
}
