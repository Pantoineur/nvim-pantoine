home = os.getenv("HOME")

if home == nil or home == '' then
	home = os.getenv("LOCALAPPDATA")
end

package.path = home .. "/.config/nvim/lua/pantoine/?.lua;" .. package.path

require("pantoine")
