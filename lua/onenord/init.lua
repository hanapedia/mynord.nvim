-- Colorscheme name:        mynord.nvim
-- Description:             A Neovim theme that combines the Nord and Atom One Dark color palettes.
-- Author:                  Ryan Mehri
-- Website:                 https://github.com/hanapedia/mynord.nvim

local config = require("onenord.config")
local util = require("onenord.util")

local mynord = {}

function mynord.setup(options)
  config.set_options(options)
  mynord.load(true)
end

function mynord.load(exec_autocmd)
  local colors = require("onenord.colors").load()

  util.load(colors, exec_autocmd)
end

return mynord
