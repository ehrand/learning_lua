#!/usr/bin/env lua

local colors = { 'red', 'green', 'blue' }

for k,v in pairs(colors) do
	print('Iterating using for loop: [' .. tostring(k) .. '] = ' .. tostring(v))
end

------------------------------------------------------------------------------------------

-- this method is a factory returning a closure
-- the closure can be used to iterate though elements of the given array
local function iterator(array)
	local index = 0
	return function()
		index = index + 1
		return array[index]
	end
end

for item in iterator({'here', 'we', 'have', 'an', 'array'}) do
	print('Handling element [' .. item .. ']')
end

