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

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)
