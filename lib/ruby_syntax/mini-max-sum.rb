#!/bin/ruby
def miniMaxSum(arr)
    # Complete this function
    se = arr.map { |num| arr.sum - num }
    puts "#{se.min} #{se.max}"
end

arr = gets.strip
arr = arr.split(' ').map(&:to_i)
miniMaxSum(arr))
