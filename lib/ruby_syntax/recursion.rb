#!/bin/ruby

def factorial(n)
  if n == 0
    1
  else
    if n > 0
     n * factorial(n-1)
    else
     puts "no factorial for -ve number"
     return 0
    end
  end

end

n = gets.strip.to_i
result = factorial(n)
puts result
