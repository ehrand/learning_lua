#!/usr/bin/env lua

--[[
--this script demonstrates how string length can be determined in lua language.
--]]

local var = 'hello';
-- note: the following two operations will return number of bytes in given string
-- (this is not always equal to number of characters)
print('string.len(var) = ' .. string.len(var))
print('#var = ' .. #var)

-- if string contains only a number it will be converted to number and can be used in math operations:
print(type('10' + 1)) -- this will print 'number'
