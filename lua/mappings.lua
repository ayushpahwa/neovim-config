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
-- keymap.set("n", "<Leader>t", "", { desc = "Run unit tests" })
-- keymap.set("n", "<Leader>tr", ":lua require('neotest').run.run()<CR>", add_description "Run test")
-- keymap.set("n", "<Leader>ts", ":lua require('neotest').run.stop()<CR>", add_description "Stop test")
-- keymap.set("n", "<Leader>tp", ":lua require('neotest').output_panel.toggle()<CR>", add_description "Toggle test panel")
-- keymap.set(
--   "n",
--   "<Leader>tc",
--   ":lua require('neotest').output_panel.clear()<CR>",
--   add_description "Clear test panel output"
-- )
-- keymap.set("n", "<Leader>to", ":lua require('neotest').output.open()<CR>", add_description "Open output window")
-- keymap.set(
--   "n",
--   "<Leader>tO",
--   ":lua require('neotest').output.open({enter = true})<CR>",
--   add_description "Open and enter output window"
-- )
-- keymap.set("n", "<Leader>ti", ":lua require('neotest').summary.toggle()<CR>", add_description "Show test summary")
-- keymap.set(
--   "n",
--   "<Leader>tf",
--   ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
--   add_description "Run test with live summary"
-- )

-- Diagnostics
keymap.set("n", "<C-m>", function()
  vim.diagnostic.jump { count = 1 }
end, opts)
keymap.set("n", "gy", ":cclose<Return>", add_description "Close the suggestions window")

-- Debugging with nvim-dap
local dap = require "dap"
local dapui = require "dapui"

-- Toggle breakpoint
keymap.set("n", "<Leader>dp", ":lua require'dap'.toggle_breakpoint()<CR>", add_description "Toggle breakpoint")

-- Start debugging (launch mode)
keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>", add_description "Start / Continue Debugging")

-- Stop debugging
keymap.set("n", "<F6>", ":lua require'dap'.terminate()<CR>", add_description "Stop Debugging")

-- Restart debugging session
keymap.set("n", "<F8>", ":lua require'dap'.restart()<CR>", add_description "Restart Debugging")

-- Step over (next line without entering function)
keymap.set("n", "<F10>", ":lua require'dap'.step_over()<CR>", add_description "Step Over")

-- Step into (enter function)
keymap.set("n", "<F11>", ":lua require'dap'.step_into()<CR>", add_description "Step Into")

-- Step out (exit function)
keymap.set("n", "<S-F11>", ":lua require'dap'.step_out()<CR>", add_description "Step Out")

-- Open DAP UI
keymap.set("n", "<Leader>du", ":lua require'dapui'.toggle()<CR>", add_description "Toggle DAP UI")

-- Show variables in floating window
keymap.set("n", "<Leader>dv", ":lua require'dapui'.eval()<CR>", add_description "Evaluate expression")

-- Show stack trace
keymap.set("n", "<Leader>dto", ":lua require'dap'.repl.open()<CR>", add_description "Show stack trace: DAP REPL")

-- Hide stack trace
keymap.set("n", "<Leader>dtc", ":lua require'dap'.repl.close()<CR>", add_description "Hide stack trace: DAP REPL")

-- Show breakpoints list
keymap.set("n", "<Leader>db", ":lua require'dap'.list_breakpoints()<CR>", add_description "List all breakpoints")

-- Clear all breakpoints
keymap.set("n", "<Leader>dc", ":lua require'dap'.clear_breakpoints()<CR>", add_description "Clear all breakpoints")

keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>", add_description "Move left")
keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>", add_description "Move right")
keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>", add_description "Move down")
keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>", add_description "Move up")
keymap.set("n", "<C-\\>", ":TmuxNavigatePrevious<CR>", add_description "Move to last window")
