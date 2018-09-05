#!/bin/ruby
# Find if the number is prime number
# def prime?(number)
#   return false if [0, 1].include?(number)
#   counter = number - 1
#   while counter > 1
#     if number % counter == 0
#       return false
#     end
#     counter -= 1
#   end
#   return true
# end

# Your code here
def take(s, start=1)
  len = s.length
  s[start,len]
end

puts take([1,2,3], 1)
puts take([1,2,3], 2)
puts take([1,2,3])
