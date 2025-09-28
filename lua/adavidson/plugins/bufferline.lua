-- Define custom highlight groups with hex colors
vim.api.nvim_set_hl(0, "BufferlineFillFg", { fg = "#ff0000" })   -- red
vim.api.nvim_set_hl(0, "BufferlineFillBg", { bg = "#1e222a" })   -- dark background
vim.api.nvim_set_hl(0, "BufferlineNormalFg", { fg = "#c0caf5" }) -- normal text
vim.api.nvim_set_hl(0, "BufferlineNormalBg", { bg = "#1e222a" }) -- normal background
vim.api.nvim_set_hl(0, "BufferlineSelFg", { fg = "#ffffff" })    -- selected white
vim.api.nvim_set_hl(0, "BufferlineSelBg", { bg = "#3b4261" })    -- selected background

-- Now your bufferline setup
local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    numbers = "none",
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    indicator = { style = "icon", icon = "▎" },
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true,
    separator_style = "thin",
    enforce_regular_tabs = true,
    always_show_bufferline = true,
  },
  highlights = {
    fill = {
      fg = { attribute = "fg", highlight = "BufferlineFillFg" },
      bg = { attribute = "bg", highlight = "BufferlineFillBg" },
    },
    background = {
      fg = { attribute = "fg", highlight = "BufferlineNormalFg" },
      bg = { attribute = "bg", highlight = "BufferlineNormalBg" },
    },
    tab_selected = {
      fg = { attribute = "fg", highlight = "BufferlineSelFg" },
      bg = { attribute = "bg", highlight = "BufferlineSelBg" },
    },
    separator_selected = {
      fg = { attribute = "bg", highlight = "BufferlineSelBg" },
      bg = { attribute = "bg", highlight = "BufferlineSelBg" },
    },
  },
}

