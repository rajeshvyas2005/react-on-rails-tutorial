#!/bin/ruby
require 'pry'

def kangaroo(x1, v1, x2, v2)
    # Complete this function
    startPoint = x1
    if x1 > x2
      startPoint = x2
    end
    firstKangarooPosition = x1
    secondKangarooPosition = x2
    (startPoint..10000).each_with_index do | country, index |
      firstKangarooPosition += v1
      secondKangarooPosition += v2
      if firstKangarooPosition == secondKangarooPosition
        return "YES"
      end
    end
    return "NO"
end

x1, v1, x2, v2 = gets.strip.split(' ')
x1 = x1.to_i
v1 = v1.to_i
x2 = x2.to_i
v2 = v2.to_i
result = kangaroo(x1, v1, x2, v2)
puts result;
