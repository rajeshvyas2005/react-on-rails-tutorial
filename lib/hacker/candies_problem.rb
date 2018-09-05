#!/bin/ruby
def candies(n, arr)
  arrcandy = Array.new(n)
  arrcandy[0] = 1
  numcandies = 1
  # num of candies to give
  i = 1
  while i < n
    if arr[i] > arr[i-1]
      numcandies = numcandies + 1
    elsif arr[i] <= arr[i-1]
      numcandies = 1
    end
    arrcandy[i] = numcandies
    i = i + 1
  end

  i = n - 2
  numcandies = 1
  total = arrcandy[n-1]
  # Reverse loop in array
  while i >= 0  do
    if arr[i] > arr[i+1]
      numcandies = numcandies + 1
    elsif arr[i] <= arr[i+1]
      numcandies = 1
    end
    arrcandy[i] = (numcandies > arrcandy[i] ? numcandies : arrcandy[i])
    total = total + arrcandy[i]
    i = i - 1
  end
  total
end

n = gets.strip.to_i
arr = Array.new(n)
for arr_i in (0..n-1)
    arr[arr_i] = gets.strip.to_i
end
result = candies(n, arr)
puts result
