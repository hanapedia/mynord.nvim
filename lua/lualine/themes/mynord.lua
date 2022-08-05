local colors = require("mynord.colors").load()

local mynord = {}

mynord.normal = {
  a = { fg = colors.bg, bg = colors.cyan, gui = "bold" },
  b = { fg = colors.cyan, bg = colors.highlight },
  c = { fg = colors.fg, bg = colors.active },
}

mynord.insert = {
  a = { fg = colors.bg, bg = colors.green, gui = "bold" },
  b = { fg = colors.green, bg = colors.highlight },
}

mynord.command = {
  a = { fg = colors.bg, bg = colors.yellow, gui = "bold" },
  b = { fg = colors.yellow, bg = colors.highlight },
}

mynord.visual = {
  a = { fg = colors.bg, bg = colors.purple, gui = "bold" },
  b = { fg = colors.purple, bg = colors.highlight },
}

mynord.replace = {
  a = { fg = colors.bg, bg = colors.red, gui = "bold" },
  b = { fg = colors.red, bg = colors.highlight },
}

mynord.inactive = {
  a = { fg = colors.light_gray, bg = colors.floating, gui = "bold" },
  b = { fg = colors.light_gray, bg = colors.floating },
  c = { fg = colors.light_gray, bg = colors.active },
}

return mynord
