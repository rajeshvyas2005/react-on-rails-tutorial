#!/bin/ruby

def sockMerchant(n, ar)
  # Complete this function
  uarray = ar.uniq
  result = 0
  uarray.each_with_index do | a, index |
    result += ((ar.select { |e| e == a}).length / 2)
  end

  result
end

n = gets.strip.to_i
ar = gets.strip
ar = ar.split(' ').map(&:to_i)
result = sockMerchant(n, ar)
puts result;
