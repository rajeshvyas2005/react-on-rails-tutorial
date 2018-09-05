#!/bin/ruby
require 'pry'
def findMedian(arr)
  # Complete this function
  sorted = arr.sort
  len = sorted.length
  (sorted[(len - 1) / 2] + sorted[len / 2]) / 2
end

n = gets.strip.to_i
arr = gets.strip
arr = arr.split(' ').map(&:to_i)
result = findMedian(arr)
puts result
