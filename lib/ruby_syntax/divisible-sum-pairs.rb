#!/bin/ruby

def divisibleSumPairs(n, k, ar)
    # Complete this function
    looprange = ar.length-1
    result = 0
    ar.each_with_index do | a, index |
      if index == looprange
        break
      end

      (index+1..looprange).each do |c|
        if (a + ar[c]) % k == 0
          result += 1
        end
      end
    end
    result

end

n, k = gets.strip.split(' ')
n = n.to_i
k = k.to_i
ar = gets.strip
ar = ar.split(' ').map(&:to_i)
result = divisibleSumPairs(n, k, ar)
puts result;
