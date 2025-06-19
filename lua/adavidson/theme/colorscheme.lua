-- TOKYO-NIGHT-THEME
-- local colorscheme = "tokyonight-night"
-- favorite
-- local colorscheme = "tokyonight-storm"
-- local colorscheme = "tokyonight-day"
local colorscheme = "tokyonight-moon"

-- Nord Theme
-- local colorscheme = "nord"

-- OneDark Theme
-- local colorscheme = "onedark"


local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
