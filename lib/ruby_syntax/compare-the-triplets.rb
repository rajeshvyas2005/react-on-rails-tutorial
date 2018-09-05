#!/bin/ruby
# def minimumCost(s)
#   4.5
# end
#
# # distanceArray = gets.chomp.split().map { |e| e.to_i  }
# n, distanceArray = gets.chomp.split()
# puts "First line #{n} and Dist #{distanceArray}"
#
# costArray = myArray = gets.chomp.split().map { |e| e.to_i  }
# puts "Second line #{costArray}"

def solve(a0, a1, a2, b0, b1, b2)
    # Complete this function
    ap = 0
    bp = 0
    if a0 != b0
      (a0 > b0) ? ap += 1 : bp += 1
    end
    if a1 != b1
      (a1 > b1) ? ap += 1 : bp += 1
    end
    if a2 != b2
      (a2 > b2) ? ap += 1 : bp += 1
    end

    [ap, bp]
end

a0, a1, a2 = gets.strip.split(' ')
a0 = a0.to_i
a1 = a1.to_i
a2 = a2.to_i
b0, b1, b2 = gets.strip.split(' ')
b0 = b0.to_i
b1 = b1.to_i
b2 = b2.to_i
result = solve(a0, a1, a2, b0, b1, b2)
puts result.join(" ")
