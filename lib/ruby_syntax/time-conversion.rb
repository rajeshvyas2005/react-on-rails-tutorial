#!/bin/ruby

def timeConversion(s)
    result = s[0..7]
    ampm = s[8..9]
    hr = result[0..1].to_i
    if ampm == "PM" && hr != 12
      result[0..1] = (hr + 12).to_s
    end

    if ampm == "AM" && hr == 12
      result[0..1] = "00"
    end
    result
end

s = gets.strip
result = timeConversion(s)
puts resultt
