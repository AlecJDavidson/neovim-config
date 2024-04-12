-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- local function my_on_attach(bufnr)
--   local api = require "nvim-tree.api"
--
--   local function opts(desc)
--     return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
--   end
--
--   -- default mappings
--   api.config.mappings.default_on_attach(bufnr)
--
--
-- Nvim-Tree
--   -- custom mappings
--   -- vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
--   -- vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
--   -- vim.keymap.set('n', 'l', '<CR>', 'o', api.tree.edit, opts('Edit'))
--   -- vim.keymap.set('n', 'h', api.tree.close_node, opts('close_node'))
--   -- vim.keymap.set('n', 'v', api.tree.vsplit, opts('vsplit'))
--   -- vim.keymap.set('l', '<CR>', 'o', api.tree.edit, opts('Edit'))
--   -- vim.keymap.set("h", api.tree.close_node, opts('close_node'))
--   -- vim.keymap.set("v", api.tree.vsplit, opts('vsplit'))
-- end


require("nvim-tree").setup({
  -- on_attach = my_on_attach,
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
