#!/usr/bin/env lua

------------------------------------------------------------------------------------------

-- only 'nil' and 'false' are considered to be false in lua; all other values are true.
local val = 0
if(val) then
	print('val tested to be true')
else
	print('val tested to be false')
end

------------------------------------------------------------------------------------------

-- and / or operator is acting differently compared to c and sh languages
print(false or 5)
print(false and 5)
