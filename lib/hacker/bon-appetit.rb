#!/bin/ruby

def bonAppetit(n, k, b, ar)
    # Complete this function
    share_cost = 0
    ar.each_with_index do | a, index |
      if index != k
        share_cost += a
      end
    end

    if b == share_cost/2
      return "Bon Appetit"
    else
      return (b - share_cost/2)
    end

end

n, k = gets.strip.split(' ')
n = n.to_i
k = k.to_i
ar = gets.strip
ar = ar.split(' ').map(&:to_i)
b = gets.strip.to_i
result = bonAppetit(n, k, b, ar)
puts result;
