#!/bin/ruby
n = gets.strip.to_i
barray = []
counter = n

begin
  barray.push(counter % 2)
  counter = counter / 2
  # puts "next counter = #{counter}"
end while counter > 0

# Reverse array
barray.reverse!

# Get consecutive 1 in binary array
maxone = 0
oddCounter  = 0
bcounter = 0
barray.each_with_index do | number, i |
  # Check each one in binary
  if number == 1
    bcounter += 1
    maxone = bcounter if maxone < bcounter
  else
    bcounter = 0
  end

end

puts "#{maxone}"
