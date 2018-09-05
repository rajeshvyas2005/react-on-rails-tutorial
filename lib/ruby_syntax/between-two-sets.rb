#!/bin/ruby
def getTotalX(a, b)
    # Complete this function
    maxvala = a.max
    maxvalb = b.max
    totallength = a.length + b.length
    result = 0

    # Range values
    ra, rb = [maxvala, maxvalb].min , [maxvala, maxvalb].max
    for num in (ra..rb)do
      # Check as condition
      sa = a.select { |e| num % e == 0}
      sb = b.select { |e| e % num == 0}
      if (sa.length + sb.length) == totallength
        result += 1
      end
    end
    result
end

n, m = gets.strip.split(' ')
n = n.to_i
m = m.to_i
a = gets.strip
a = a.split(' ').map(&:to_i)
b = gets.strip
b = b.split(' ').map(&:to_i)
total = getTotalX(a, b)
puts total
