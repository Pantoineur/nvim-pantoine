home = os.getenv("HOME")
package.path = home .. "/.config/nvim/lua/pantoine/?.lua;" .. package.path

require("pantoine")
print("toto")
