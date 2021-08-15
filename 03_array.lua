#!/usr/bin/env lua

local arr = {}
arr[1] = 'first'
arr[2] = 'second'
arr[3] = 'third'
arr[5] = 'fifth'

-- the array does not have an element under index 4
-- therefore lua will calculate the size of array with elements 1 - 3
print('Array size: ' .. #arr)
for i = 1, 5, 1 do
	print('Array element [' .. i .. '] = ' .. tostring(arr[i]))
end
