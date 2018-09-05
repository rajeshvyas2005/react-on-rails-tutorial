#!/bin/ruby
def birthdayCakeCandles(n, ar)
    # Complete this function
    m = ar.max
    s = ar.select { |a| a == m}
    puts "#{s.count}"
end

n = gets.strip.to_i
ar = gets.strip
ar = ar.split(' ').map(&:to_i)
result = birthdayCakeCandles(n, ar)
puts result;
