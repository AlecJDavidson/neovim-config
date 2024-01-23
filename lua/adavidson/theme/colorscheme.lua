-- TOKYO-NIGHT-THEME
-- local colorscheme = "tokyonight-night"
local colorscheme = "tokyonight-storm"
-- local colorscheme = "tokyonight-day"
-- local colorscheme = "tokyonight-moon"

-- Nord Theme
-- local colorscheme = "nord"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
