#!/bin/ruby

n = gets.strip.to_i
arr = gets.strip
arr = arr.split(' ').map(&:to_i)

counter = n - 1
while counter >= 0
  if counter == 0
    print "#{arr[counter]}"
  else
    print "#{arr[counter]} "
  end
  counter -= 1
end
