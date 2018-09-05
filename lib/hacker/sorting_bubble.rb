n = gets.strip.to_i
a = gets.strip
a = a.split(' ').map(&:to_i)
# Write Your Code Here

counter = 0
n = a.length
a[0..n-1].each_with_index do | x, i |
  a[0..n-1].each_with_index do |y, j|
    if j == n-1
      break
    end
    if (a[j] > a[j + 1])
      s = a[j]
      a[j] = a[j + 1]
      a[j + 1] = s
      counter = counter + 1
    end
  end
  if (counter == 0)
    break
  end
end

# puts "Array is #{a}"
puts "Array is sorted in #{counter} swaps."
puts "First Element: #{a.first}"
puts "Last Element: #{a.last}"
