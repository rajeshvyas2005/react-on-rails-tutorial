#!/bin/ruby

def aVeryBigSum(n, ar)
    # Complete this function
    s = 0
    ar.each do | a |
      s+=a
    end
    s
end

n = gets.strip.to_i
ar = gets.strip
ar = ar.split(' ').map(&:to_i)
result = aVeryBigSum(n, ar)
puts result;
