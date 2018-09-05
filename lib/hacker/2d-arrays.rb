#!/bin/ruby
arr = Array.new(6)
for arr_i in (0..6-1)
    arr_t = gets.strip
    arr[arr_i] = arr_t.split(' ').map(&:to_i)
end

sum = []
h = 0
# NxN matrix = (N-2)*(N-2) hourglasses
n = arr.length
arr[0...n-2].each_with_index do | x, i |
  arr[0...n-2].each_with_index do |y, j|
    # puts "element [#{xi}, #{yi}] is #{y}"
    sum[h] = arr[i][j] + arr[i][j+1] + arr[i][j+2]
    sum[h] += arr[i+1][j+1]
    sum[h] += arr[i+2][j] + arr[i+2][j+1]+ arr[i+2][j+2]
    h += 1
  end
end
puts sum.max

# 2D array
# Simple print two dimension array
# arr.each_with_index do |x, xi|
#   x.each_with_index do |y, yi|
#     puts "element [#{xi}, #{yi}] is #{y}"
#   end
# end
