#!/bin/ruby
t = gets.strip.to_i
phonediary = {}
for a0 in (0..t-1)
    q = gets.strip
    q = q.split(' ')
    phonediary [q[0]] = q[1]
end

for a0 in (0..100000)
    q = gets.strip
    # phone = h.select {|k,v| k == q}
    if phonediary[q] && !phonediary[q].empty?
      puts "#{q}=#{phonediary[q]}"
    else
      puts "Not found"
    end
end
