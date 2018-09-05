#!/bin/ruby

def staircase(n)
  1.upto n do |s|
    print ' ' * (n-s)
    print '#' * s
    puts
  end
end

n = gets.strip.to_i
staircase(n)
