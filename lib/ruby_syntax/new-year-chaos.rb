#!/bin/ruby
ans = 119814

def minimumBribes(q)
    # Complete this function
    mcounter = {}
    n = q.length
    # puts "Value of n = #{n}"
    bcounter = 0
    barray = q
    qarray = (1..n).to_a

    # Default counter is 0
    (1..n).each do | c|
      mcounter[c] = 0
    end

    # puts "Start hash: #{mcounter}"

    counter = n - 1
    scounter = 0

    # puts "Queue array: #{qarray}"
    # puts "Final array: #{q}"
    while counter > 0
      # Swapping and fix position for this element
      celement = q[counter]
      if qarray[counter] != celement
        # Check sequence
        curindex = qarray.find_index(celement)
        if (curindex != 0) && (qarray[curindex-1] == q[counter-1])
          next
        end

        if (counter != n-1) && (qarray[curindex+1] == q[counter+1])
          next
        end

        # belement = q[counter-1]

        # puts "First #{celement} #{mcounter[celement]}"
        # puts "Second #{belement} #{mcounter[belement]}"
        # Do not move any element more than one time
        # Get position of element in current array

        index = qarray.find_index(celement)
        if index != counter
          belement = qarray[index + 1]
          mcounter.store(belement, mcounter[belement]+1)
          if mcounter[belement] > 2
            puts "Too chaotic"
            return
          end

          qarray.swap!(index, index + 1)
          scounter += 1
          puts "First Swap Queue array: #{qarray}"
        end



        # puts " Inter2 #{q} and  #{qarray}"
        # puts "Array Inter1 #{(q - qarray).length.to_s}"

        index = qarray.find_index(celement)
        if index != counter
          mcounter.store(celement, mcounter[celement]+1)
          mcounter.store(belement, mcounter[belement]+1)
          if mcounter[celement] > 2
            puts "Too chaotic"
            return
          end
          qarray.swap!(index, index + 1)
          scounter += 1
          # puts "Second Swap Queue array: #{qarray}"
        end

        # puts " Inter2 #{q} and  #{qarray}"
        # puts "Array Inter2 #{(q - qarray).length.to_s}"

        if qarray[counter] != celement
          puts "Too chaotic"
          return
        end
      end

      counter -= 1
    end

    # puts "#{scounter}"

end


class Array
  def swap!(a, b)
    self[a], self[b] = self[b], self[a]
    self
  end
end

Dir.chdir("/Users/rajeshvyas/projects/react-on-rails-tutorial/lib/")
f = File.open("ruby_syntax/input_fiile_bribe.txt", "r")
f.each_with_index do |line, index|
  if index == 2
    q = line.split(' ').map(&:to_i)
    minimumBribes(q)
  end
end
f.close



# f.each_line do |line|
#
#   if(!line.chomp.empty?)
#     puts "LAST LINE, do something to it"
#   else
#     puts line
#   end
# end
# f.close

# t = gets.strip.to_i
# for a0 in (0..t-1)
#     n = gets.strip.to_i
#     q = gets.strip
#     q = q.split(' ').map(&:to_i)
#     minimumBribes(q)
# end
