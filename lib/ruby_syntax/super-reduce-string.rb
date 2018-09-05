#!/bin/ruby

# How to run this filre => ruby super-reduce-string.rb
def super_reduced_string(s)
    # puts "Original String: #{s}"

    # Complete this function
    s.each_char.each_with_index do |char, i|
      # puts "Index #{i} Char #{char}"
      # Get all string with alternative chars
      if i == 0
        next
      end
      if s[i]
        if (s[i] == s[i-1])
          # puts "S Plus #{s[i]}"
          # puts "S Minu #{s[i-1]}"
          pair = s[i] + s[i-1]
          s.slice! pair
          # puts "Remove string: #{s}"
          super_reduced_string(s)
        end
      end
    end

    # puts "Final String: #{s}"
    if s == ""
      return "Empty String"
    end
    s
end

s = gets.strip
result = super_reduced_string(s)
puts result;
