class Person
	def initialize(firstName, lastName, id)
		@firstName = firstName
		@lastName = lastName
		@id = id
	end
	def printPerson()
		print("Name: ",@lastName , ", " + @firstName ,"\nID: " , @id)
	end
end

class Student <Person
  # Write your constructor here
  def initialize( firstName, lastName, id, scores )
    @firstName=firstName
    @lastName =lastName
    @id=id
    @scores=scores
  end

  # Return: A character denoting the grade.
  def calculate
    avg_scores = ((@scores.inject(0){|sum,x| sum + x }) / @scores.length)
    if avg_scores >= 90 && avg_scores <= 100
      return 'O'
    elsif avg_scores >= 80 && avg_scores < 90
      return 'E'
    elsif avg_scores >= 70 && avg_scores < 80
      return 'A'
    elsif avg_scores >= 55 && avg_scores < 70
      return 'P'
    elsif avg_scores >= 40 && avg_scores < 55
      return 'D'
    elsif avg_scores < 40
      return 'T'
    end
  end
end

input = gets.split()
firstName = input[0]
lastName = input[1]
id = input[2].to_i
numScores = gets.to_i
scores = gets.strip().split().map!(&:to_i)
s = Student.new(firstName, lastName, id, scores)
s.printPerson
print("\nGrade: " + s.calculate)
