-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Removing the autocmds we don't need - this is the only way to do so for lazyvim default cmds,
-- as seen here : https://www.lazyvim.org/configuration/keymaps#global-keymaps
local to_remove = {
  -- All terminal commands :
  { "<leader>fT", mode = { "n" } },
  { "<leader>ft", mode = { "n" } },
  { "<c-/>", mode = { "n", "t" } },
  { "<c-_>", mode = { "n", "t" } },
}
for _, el in pairs(to_remove) do
  vim.keymap.del(el.mode, el[1])
end

-- Move around with centered cursor.
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Opens a floating terminal
map({ "n", "t" }, "<c-!>", function()
  vim.cmd(":FloatermToggle")
end, { desc = "Terminal (Root Dir)" })
