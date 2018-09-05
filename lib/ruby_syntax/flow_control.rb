# flow_control.rb
# How to run this filre => ruby flow_control.rb

# [IF ELSE]
def caps(string)
  if string.length > 5 && string.length < 7
    string.upcase
  elsif string.length == 5 || string.length == 4
      string.upcase
  else
    string
  end
end
puts "Caps: #{caps("Rajesh")}"
puts "Caps: #{caps("Cookie")}"
puts "No Caps: #{caps("Cookie Vagabond")}"

# [SWITCH CASE]
print "Please enter the number (5~10) >> "
x = gets.chomp.to_i
case x
when 5, 4
  puts "Enter number is 4 or 5"
when 6, 7
  puts "Enter number is 6 or 7"
else
  puts "Enter number is neither 5, nor 6"
end

# [TERNARY OPRATOR]
a = (x % 2 == 0) ? "The numer is even" : "The numer is odd"
puts "#{a}"

# [TRUE FALSE]
if x
  puts "[TRUE or FALSE] => Always true except for nil and false"
else
  puts "it is not true"
end
