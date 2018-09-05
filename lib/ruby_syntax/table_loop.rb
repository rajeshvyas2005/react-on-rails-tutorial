#!/bin/ruby

n = gets.strip.to_i

(1..10).each_with_index do | country, index |
  puts "#{n} x #{index+1} = #{n*(index+1)}"
end
