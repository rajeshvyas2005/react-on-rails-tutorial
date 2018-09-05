#!/bin/ruby
def manualsorting(a)
  counter = 0
  a.each_with_index do | x, i |
    if x % 2 != 0
      index = findeven(a)
      if index > i
        s = a[i]
        a[i] = a[index]
        a[index] = s
        counter = counter + 1
      end
    end
  end
  return counter
end

def findeven(a)
  len = a.length
  a.reverse.each_with_index do | x, i |
    if x % 2 == 0
      return (len - 1 - i)
    end
  end
  return 0
end

n = gets.strip.to_i
grades = Array.new(n)
for grades_i in (0..n-1)
    grades[grades_i] = gets.strip.to_i
end
result = manualsorting(grades)
puts "Here is total number of swap:" + result.to_s
