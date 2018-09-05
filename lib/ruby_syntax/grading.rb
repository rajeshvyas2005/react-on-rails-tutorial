#!/bin/ruby

def solve(grades)
    # Complete this function
    result = []
    grades.each do | g |
      if g < 38
        # No Rounding
        result.push(g)
      else
        # No Rounding
        nextmultiple = (5 - g % 5) + g
        if nextmultiple - g < 3
          result.push(nextmultiple)
        else
          result.push(g)
        end
      end
    end
    result
end

n = gets.strip.to_i
grades = Array.new(n)
for grades_i in (0..n-1)
    grades[grades_i] = gets.strip.to_i
end
result = solve(grades)
print result.join("\n")
