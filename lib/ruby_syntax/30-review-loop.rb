def solve(a_string)
    # Complete this function
    result = []
    a_string.each do | s |
      allEven = ""
      allOdd = ""
      s.each_char.each_with_index do |char, i|
        # Get all string with alternative chars
        allEven << char if i%2 ==0
        allOdd << char if i%2 !=0
      end
      puts "#{allEven} #{allOdd}"
    end
end

n = gets.strip.to_i
a_string = Array.new(n)
for string_i in (0..n-1)
    a_string[string_i] = gets.strip
end
solve(a_string)
