# hashes.rb
# How to run this filre => ruby hashes.rb

person = {name: 'Cookie', gender: 'female', weight: '150 Kg', hair: 'black'}
person.each do |key, value|
  puts "Cookie's #{key} is #{value}"
end


# TODO Push value in hash dynamically

puts "Cookie has key gender : #{person.has_key?(:gender)}"
puts "Select gender Key: #{person.select { |k,v| k == :gender }}"
puts "All Keys: #{person.keys}"
