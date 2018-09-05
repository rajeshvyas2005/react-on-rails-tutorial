#!/bin/ruby

def safeParse(strToParse)
  if strToParse =~ /\A\d+\Z/
    strToParse.to_i
  else
    raise Exception
  end
end

# Way 2
def checkNumber2(n)
	begin
		puts safeParse(n)
	rescue Exception
		puts "Bad String"
	end
end

# Way 1
def checkNumber1(n)
	begin
		puts Integer(n)
	rescue Exception
		puts "Bad String"
	end
end

S = gets.strip
checkNumber1(S)
# OR
checkNumber2(S)

# Way 3 
def main(n)
	puts Integer(n)
rescue
	puts "Bad String"
end

S = gets.strip
main(S)
