#!/bin/ruby
def plusMinus(arr)
    # Complete this function
    pn = 0
    nn = 0
    zn = 0
    arr.each do |a|
      if a > 0
        pn += 1
      end
      if a < 0
        nn += 1
      end
      if a == 0
        zn += 1
      end
    end
    puts "%.#{arr.length}f" % (pn.to_f/arr.length)
    puts "%.#{arr.length}f" % (nn.to_f/arr.length)
    puts "%.#{arr.length}f" % (zn.to_f/arr.length)
end

n = gets.strip.to_i
arr = gets.strip
arr = arr.split(' ').map(&:to_i)
plusMinus(arr)
