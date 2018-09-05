#!/bin/ruby

def breakingRecords(score)
  hscore = score.first
  lscore = score.first

  highestBreak = 0
  lowestBreak = 0

  # Complete this function
  for s in score do
    if s > hscore
      hscore = s
      highestBreak += 1
    end

    if s < lscore
      lscore = s
      lowestBreak += 1
    end
  end

  return [highestBreak,lowestBreak]
end

n = gets.strip.to_i
# Check if input less than n
score = gets.strip
score = score.split(' ').map(&:to_i)
result = breakingRecords(score)
print result.join(" ")
