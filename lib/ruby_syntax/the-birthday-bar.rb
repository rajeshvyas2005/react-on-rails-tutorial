#!/bin/ruby

def solve(n, s, d, m)
    maxpiece = m
    totalsum = d
    resultcount = 0
    # Complete this function
    s.each_with_index do | serial, index |
      total = 0

      if (index + m - 1) >= s.count
        next
      end

      (0..m-1).each do |c|
        cindex = index + c

        total += s[cindex]
      end

      if total == totalsum
        resultcount += 1
      end
    end
    resultcount
end

n = gets.strip.to_i
s = gets.strip
s = s.split(' ').map(&:to_i)
d, m = gets.strip.split(' ')
d = d.to_i
m = m.to_i
result = solve(n, s, d, m)
puts result;
