# loops.rb
# How to run this filre => ruby loops.rb

# Controlling Loop
puts "[LOOP]"
# LOOP
print "Please enter the start point of the loop (1~3) >> "
x = gets.chomp.to_i
loop do
  x += 1
  if x == 4
    # skip rest of the code in this iteration
    next
  end
  puts x
  if x == 10
    break
  end
end

puts "[WHILE LOOP]"
# While Loop
print "Please enter the number you want to loop through >> "
x = gets.chomp.to_i
while x >= 0
  puts x
  # <- refactored this line
  x -= 1
end

puts "[UNTIL LOOPS]"
# Until Loop
print "Please enter the number you want to loop through >> "
x = gets.chomp.to_i
until x < 0
  puts x
  x -= 1
end

puts "[DO WHILE]"
# Do While Loop
begin
  print "Do you want to be inside loop (Y/N)? "
  # Whatever is the answer do while loop run at least one time
  answer = gets.chomp
  puts "You are again in trap :)"
end while answer.casecmp('Y') == 0

puts "[FOR LOOPS]"
# For Loops
x = [1, 2, 3]
for i in x do
  puts i
end

puts "[ITERATOR EACH]"
# Each with index
travel_countries= ["USA","UK","INDIA"]
travel_countries.each do | country |
  puts "Country: #{country}"
end

puts "[ITERATOR EACH WITH INDEX]"
# Each with index
travel_countries.each_with_index do | country, index |
  puts "Index: #{index}. #{country}"
end

puts "[PRINT 3 TIMES]"
# Loop something with decides times
my_country= "INDIA"
x = 0
3.times do
  x += 1
  puts "#{x}: #{my_country}"
end
