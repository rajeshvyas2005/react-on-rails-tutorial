#!/bin/ruby

def migratoryBirds(n, ar)
  mcounter = {}
  (1..5).each do |c|
    mcounter[c] = (ar.select { |e| e == c}).length
  end
  allmax = mcounter.select {|k,v| v == mcounter.values.max }
  # Get the which has max value
  (allmax.first).first
  # hash last key value
  # allmax.to_a.last
end

n = gets.strip.to_i
ar = gets.strip
ar = ar.split(' ').map(&:to_i)
result = migratoryBirds(n, ar)
puts result;
