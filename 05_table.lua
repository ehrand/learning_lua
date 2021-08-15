#!/usr/bin/env lua

local t = {}
t["a"] = 1
t.b = 20

for _, v in pairs(t) do
	print('Current value: ' .. tostring(v))
end

------------------------------------------------------------------------------------------

-- tables are assigned using refences; this means both, t & u are pointing to the same data.
local u = t
u.a = 10
for _, v in pairs(t) do
	print('Current value: ' .. tostring(v))
end
