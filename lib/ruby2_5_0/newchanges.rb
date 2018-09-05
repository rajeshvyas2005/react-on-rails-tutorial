# newchanges.rb
# How to run this filre => ruby newchanges.rb

# [RESCUE IN DO/END BLOCKS]
[3].each do |n|
  puts "Here is the value of n : #{n}"
  n / 0
rescue
  # rescue
  puts "Rescue error detected in loop"
else
  puts "Ok without error"
  # else
ensure
  puts "All code here must be executed"
  # ensure
end
