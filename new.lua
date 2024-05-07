function New(x)
	print("new"..x)
end

function Fib(n)
	if n == 0 then
		return 0
	elseif n == 1 then
		return 1
	else
		return Fib(n-1) + Fib(n-2)
	end
end

local function pgcd(a, b)
	if b == 0 then
		return a
	else
		return pgcd(b, a % b)
	end
end




local sum = 0
local vals = {}
for i = 1, 10 do
	sum = sum + i
	print("x" .. sum) -- x1
	vals[i] = sum
end

for i, v in ipairs(vals) do
	print(i.." : " .. v) -- v1
end

for i = 1, 10 do
	print("Fib "..pgcd(i^2 - 2, i) )
end

local s = "[in brackets]"
for i = 1, #s do
	local t = ''
	for _ = 1, #s-i do
		t = t .. ' '
	end
	local tt = string.sub(s, 1, i)
	print(t..tt..string.reverse(tt))
end


local ff = {1,1}

for i = 3, 10 do
	ff[i] = ff[i-1] + ff[i-2]
end

for i, v in ipairs(ff) do
	print(i.." : " .. v) -- v1
end

local ss = ''
for i = 1, #ff do
	ss = ss .. ff[#ff + 1 - i] .. ' '
end

print(ss)


local lower_case = 'abcdefghijklmnopqrstuvwxyz'

local function cesar(s, n)
	local res = ''
	for i = 1, #s do
		local c = string.sub(s, i, i)
		local idx = string.find(lower_case, c)
		if idx then
			idx = (idx + n - 1) % 26 + 1
			res = res .. string.sub(lower_case, idx, idx)
		else
			res = res .. c
		end
	end
	return res
end

local test_str = 'hello world'
print(cesar(test_str, 3)) -- khoor zruog

local char2num = {}
for i = 1, #lower_case do
	char2num[string.sub(lower_case, i, i)] = i
end

local crypt = ''

for i= 1 , #test_str do
	local c = string.sub(test_str, i, i)
	local idx = char2num[c]
	if idx then
		idx = (idx + 3 - 1) % 26 + 1
		c = string.sub(lower_case, idx, idx)
	end
	crypt = crypt .. c

end
print(crypt)


local function shuffle(t)
	local n = #t
	for i = 1, n do
		local j = math.random(i, n)
		t[i], t[j] = t[j], t[i]
	end
end


local t = {1,2,3,4,5,6,7,8,9,10}
shuffle(t)

local function print_table(t)
	local s = ''
	for i = 1, #t do
		s = s .. t[i] .. ' '
	end
	print(s)
end

print_table(t)

local function quicksort(t)
	if #t <= 1 then
		return t
	end
	local pivot = t[1]
	local left = {}
	local right = {}
	for i = 2, #t do
		if t[i] < pivot then
			table.insert(left, t[i])
		else
			table.insert(right, t[i])
		end
	end
	left = quicksort(left)
	right = quicksort(right)
	table.insert(left, pivot)
	for i = 1, #right do
		table.insert(left, right[i])
	end
	return left
end


print_table(quicksort(t))

local function zeros(N,c)
	N = N or 10
	c = c or '.'
	mt = {}          -- create the matrix
    	for i=1,N do
      		mt[i] = {}     -- create a new row
      		for j=1,N do
        		mt[i][j] = '.'   -- initialize the cells
      		end
    	end
	return mt
	end


local function print_matrix(m)
	for i = 1, #m do
		local s = ''
		for j = 1, #m[i] do
			s = s .. m[i][j] .. ' '
		end
		print(s)
	end
end

local mt = zeros()

for i = 1, #t do
	mt[i][t[i]] = 'o'
end

print_matrix(mt)
--

local function cumsum(t)
	local res = {}
	local sum = 0
	for i = 1, #t do
		sum = sum + t[i]
		res[i] = sum
	end
	return res
end

local function range(s,e,step)
	step = step or 1
	s = s or 0
	local res = {}
	for i = s, e, step do
		table.insert(res, i)
	end
	return res
end

print_table(range(-10, 10))

local function linspace(s,e,n)
	local step = (e - s) / (n - 1)
	return range(s, e, step)
end


print_table(linspace(0,6.28,10)) 
local	 T = linspace(0,6.28,10)

for _, t in ipairs(T) do
	print(5+ 5*math.sin(t))
end

local function dot(t1, t2)
	-- technically should test that #t1 == #t2
	assert(#t1 == #t2, "t1 and t2 must have the same length")
	local res = 0
	for i = 1, #t1 do
		res = res + t1[i] * t2[i]
	end
	return res
end

local X = {1,2,3}
local Y = {4,5,6}
print(dot(X, Y))

print(math.sqrt(dot(X, X)))


local function reshape(t, n, m)
	local res = {}
	local idx = 1
	for i = 1, n do
		res[i] = {}
		for j = 1, m do
			res[i][j] = t[idx]
			idx = idx + 1
		end
	end
	return res
end

local function transpose(m)
	local res = {}
	for i = 1, #m[1] do
		res[i] = {}
		for j = 1, #m do
			res[i][j] = m[j][i]
		end
	end
	return res
end

local yy = transpose(reshape(range(1, 12), 3, 4))

print_matrix(yy)



