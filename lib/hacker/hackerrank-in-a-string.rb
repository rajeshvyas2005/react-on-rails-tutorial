#!/bin/ruby
# require 'pry'

def hackerrankInString(s)
	h = "hackerrank"
	# Complete this function
	sindex = 0
	counter = 0
	result = ""
	h.each_char.each_with_index do |x, xi|
		i = s.index(x, sindex)
		# binding.pry
		if i != nil
			sindex = i + 1
			counter += 1
		end
	end

	if counter == h.length
		result = "YES"
	else
		result = "NO"
	end
	result
end

q = gets.strip.to_i
for a0 in (0..q-1)
	s = gets.strip
	result = hackerrankInString(s)
	puts result
end
