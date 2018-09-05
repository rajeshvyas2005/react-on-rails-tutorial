#!/bin/ruby
def diagonalDifference(a)
    # Complete this function
    pd = 0
    sd = 0
    a.each_with_index do |ar, i|
      pd += ar[i]
      sd += ar[ar.length-(i+1)]
    end
    (pd - sd).abs
end

n = gets.strip.to_i
a = Array.new(n)
for a_i in (0..n-1)
    a_t = gets.strip
    a[a_i] = a_t.split(' ').map(&:to_i)
end
result = diagonalDifference(a)
puts result
