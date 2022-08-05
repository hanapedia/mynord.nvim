-- Refresh cache for local debugging and development purposes
if vim.g.mynord_debug == true then
  package.loaded["mynord"] = nil
  package.loaded["mynord.util"] = nil
  package.loaded["mynord.colors"] = nil
  package.loaded["mynord.colors.mynord"] = nil
  package.loaded["mynord.colors.mynordlight"] = nil
  package.loaded["mynord.theme"] = nil
end

local mynord = require("mynord")

mynord.load(false)
