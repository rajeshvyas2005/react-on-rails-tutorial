#!/bin/ruby
# require 'active_record'
# memo_coding.rb
# How to run this filre => ruby memo_coding.rb

# def camelcase(s)
#     s.camelize(:lower)
# end
#
# s = gets.strip
# result = camelcase(s)
# puts result
#
# all_substring=result.split /(?=[A-Z])/
# puts all_substring.length


#  All word in camel case
# puts gets.strip.count('A-Z') + 1

# Print a string with alternative same charaters and return max length string among them
def twoCharaters(s)
    # Complete this function
    return 0 unless s || s.chars
    uniqChars = s.chars.uniq
    if uniqChars && uniqChars.length < 2
      return 0
    end

    new_combination_array = uniqChars.combination(2).to_a
    # Remove chars from string
    alternateStringArray = []
    new_combination_array.each do | c |
      allEven = ""
      allOdd = ""
      firsChar = c[0]
      lastChar = c[1]

      # Loop through array
      test_string = s.each_char.select do |char|
        char == firsChar || char == lastChar
      end

      if test_string.uniq.length == 2
        test_string.each_with_index do |char, i|
          # Get all string with alternative chars
          allEven << char if i%2 ==0
          allOdd << char if i%2 !=0
        end

        if (allEven.chars.uniq).length == 1 && (allOdd.chars.uniq).length == 1
          alternateStringArray.push(test_string)
        end
      end
    end

    if alternateStringArray.length == 0
      return 0
    end
    (alternateStringArray.max_by(&:length)).length
end

l = gets.strip.to_i
i = gets.strip.downcase
result = 0
if i.length == l && i.length >=1 && i.length <= 1000
  s = i.gsub(/[^A-Za-z]/, '')
  result = twoCharaters(s)
end

puts result
