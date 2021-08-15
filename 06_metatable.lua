#!/usr/bin/env lua

------------------------------------------------------------------------------------------

--[[
After creation a table does not have a valid meta table (it is set to nil).
To set a meta table function setmetatable needs to be used explicitly:
--]]
local container_data = {
	value = 5;
}

------------------------------------------------------------------------------------------

local container_meta = {

	--[[
	there are following math operations available:
	__add: Addition, when writing "table + object" or "object + table"
	__sub: Subtraction, when writing "table - object" or "object - table"
	__mul: Multiplication, when writing "table * object" or "object * table"
	__div: Division, when writing "table / object" or "object / table"
	__mod: Modulo, when writing "table % object" or "object % table"
	__pow: Involution, when writing "table ^ object" or "object ^ table"

	additionally we can use following operators to define comparison operations:
	__eq: Check for equality, when table1 == table2 is evaluated
	__lt: Check for less than, when table1 < table2 is evaluated
	__le: Check for less than or equal to, when table1 <= table2 is evaluated

	following string operations can be defined, too:
	__tostring: Expected to return a string representation of a table. Takes a single argument, the table being converted to a string.
	__len: Expected to return the length of the table when writing #table. Takes a single argument, the table whose length we are trying to find.
	__concat: Expected to concatenate two tables when writing table1 .. table2.
	--]]

	-- called on attempt to add a number.
	__add = function(left, right)
		return left.value + right;
	end,

	-- called on attempt to access a nonexixting element in the table.
	__index = function(table, key)
		print(tostring(table) .. '~> accessing a nonexisting element[' .. tostring(key) .. ']');
		return 'empty';
	end,

	-- called on attempt to assign a value to new element.
	__newindex = function(table, key, value)
		print(tostring(table) .. '~> assigning a nonexisting element[' .. tostring(key) .. ' = ' .. tostring(value) .. ']');
		--[[
			trying to assign a value directly on the table leads to recursive function calls until stack overflow happens.
			table[key] = value;
			better use rawset variant here.
		--]]
		rawset(table, key, value);
	end,

	-- called when the table is used like a functable
	__call = function()
		print(tostring(table) .. '~> being used like a function');
	end,

}

------------------------------------------------------------------------------------------

local query = getmetatable(container_data);
print('Our container has metatable: ' .. type(query));

setmetatable(container_data, container_meta);
-- we can also explicitly specify a string that needs to be printed instead of 'table' or 'nil'.
print('Our container has metatable: ' .. (query and 'true' or 'false'));
print('Our container has metatable: ' .. type(getmetatable(container_data)));
print(getmetatable(container_data));

local result = container_data + 4;	-- this line works only after setting the metatable
print('\nAfter adding we have following result: ' .. result);

print('\nLets get what is not there...' .. container_data.v);

print('\nAssigning to a new element...')
container_data.i = 'hello';

print('\nUsing table like a callable object...')
container_data()
