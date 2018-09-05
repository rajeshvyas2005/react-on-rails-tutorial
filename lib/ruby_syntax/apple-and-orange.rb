#!/bin/ruby

def appleAndOrange(s, t, a, b, apple, orange)
    # Complete this function
    tapple = 0
    tornage = 0
    alocation = a
    olocation = b

    apple.each do |a|
      d = alocation + a
      tapple += 1 if (s..t).include?(d)
    end

    orange.each do |o|
      d = olocation + o
      tornage += 1 if (s..t).include?(d)
    end
    [tapple,tornage]
end

s, t = gets.strip.split(' ')
s = s.to_i
t = t.to_i
a, b = gets.strip.split(' ')
a = a.to_i
b = b.to_i
m, n = gets.strip.split(' ')
m = m.to_i
n = n.to_i
apple = gets.strip
apple = apple.split(' ').map(&:to_i)
orange = gets.strip
orange = orange.split(' ').map(&:to_i)
result = appleAndOrange(s, t, a, b, apple, orange)
print result.join("\n")
