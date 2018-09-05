# arrays.rb
# How to run this filre => ruby arrays.rb

array = [9, 'Cookie', 5.5, 'Vagabond']
puts "Array : #{array}"
puts "First element : #{array.first}"
puts "Last element : #{array.last}"
puts "First index[0] element : #{array[0]}"
puts "Array Pop element : #{array.pop}"
puts "Array Push element : #{array.push('Vagabond')}"

# Push element in array
array << "Blog"
puts "Array After another Push element : #{array}"

# Map array
a = [1, 2, 3, 4, 5]
puts "Before MAP : #{a}"
puts "After MAP (num + 1) : #{a.map { |num| num + 1 }}"
puts "Deleted first element : #{a.delete_at(0)}"

# Map array
a = [1, 2, 3, 4, 5, 5, 4, 3, 2, 6]
puts "Before Array : #{a}"
puts "Remove duplicate: #{a.uniq}"
puts "Original Array: #{a}"
puts "Remove duplicate destructively: #{a.uniq!}"
puts "Original Array: #{a}"
puts "Select all number greater than 4: #{a.select { |number| number > 4}}"
puts "Array include 2: #{a.include?(2)}"
puts "Array sort: #{a.sort}"

array = [1, 2, [3, 4, 5], [6, 7]]
puts "Flatten #{array} into : #{array.flatten}"
