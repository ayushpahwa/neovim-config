require "nvchad.mappings"
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Function to merge opts and add description
local function add_description(desc)
  local new_opts = vim.tbl_extend("force", opts, { desc = desc })
  return new_opts
end

keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- File explorer with NvimTree
keymap.set("n", "<Leader>e", ":NvimTreeToggle<Return>", add_description "Toggle treesitter")

-- Tabs
keymap.set("n", "<tab>", ":bnext<Return>", add_description "Goto next tab")
keymap.set("n", "<s-tab>", ":bprev<Return>", add_description "Goto last tab")

-- Window operations
keymap.set("n", "s", "", add_description "Window operations")

-- Split window
keymap.set("n", "ss", ":split<Return>", add_description "Split screen vertically")
keymap.set("n", "sv", ":vsplit<Return>", add_description "Split screen horizontally")

-- Move window
keymap.set("n", "sh", "<C-w>h", { desc = "Move cursor to left split" })
keymap.set("n", "sk", "<C-w>k", { desc = "Move cursor to upper split" })
keymap.set("n", "sj", "<C-w>j", { desc = "Move cursor to down split" })
keymap.set("n", "sl", "<C-w>l", { desc = "Move cursor to right split" })

-- Neotest
keymap.set("n", "<Leader>t", "", { desc = "Run unit tests" })
keymap.set("n", "<Leader>tr", ":lua require('neotest').run.run()<CR>", add_description "Run test")
keymap.set("n", "<Leader>ts", ":lua require('neotest').run.stop()<CR>", add_description "Stop test")
keymap.set("n", "<Leader>tp", ":lua require('neotest').output_panel.toggle()<CR>", add_description "Toggle test panel")
keymap.set(
  "n",
  "<Leader>tc",
  ":lua require('neotest').output_panel.clear()<CR>",
  add_description "Clear test panel output"
)
keymap.set("n", "<Leader>to", ":lua require('neotest').output.open()<CR>", add_description "Open output window")
keymap.set(
  "n",
  "<Leader>tO",
  ":lua require('neotest').output.open({enter = true})<CR>",
  add_description "Open and enter output window"
)
keymap.set("n", "<Leader>ti", ":lua require('neotest').summary.toggle()<CR>", add_description "Show test summary")
keymap.set(
  "n",
  "<Leader>tf",
  ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
  add_description "Run test with live summary"
)

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)
keymap.set("n", "gy", ":cclose<Return>", add_description "Close the suggestions window")
