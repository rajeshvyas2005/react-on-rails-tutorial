#!/bin/ruby

def passed_solve(year)
    # Complete this function
    if (year == 1918)
        return "26.09.1918"
    elsif ((year <= 1917) && (year%4 == 0)) || ((year > 1918) && (year%400 == 0 || ((year%4 == 0) && (year%100 != 0))))
        return sprintf("12.09.%04d", year)
    else
        return sprintf("13.09.%04d", year)
    end
end



def solve(year)
    d = 0
    for m in (1..12)
      if d + 28 > 256
        # get days of month
        dom = 256 - d
        return sprintf("%02d.%02d.%04d", dom, m, year)
      end
      if year.between?(1700,1917)
        # old calender (1700 - 1917)
        # Check leap month
        if m == 2
          # Check centurian year
          if year % 100 == 0
            if (year % 400 == 0) && (year % 4 == 0)
              d += 29
            else
              d += 28
            end
          else
            if year % 4 == 0
              d += 29
            else
              d += usual_calender[m-1]
            end
          end
        else
          d += usual_calender[m-1]
        end
      elsif year.between?(1999,2700)
        # New calender (1999 - 2700)
        # Check leap month
        if (m == 2) && ((year % 400 == 0) || (year % 4 == 0 && year % 100 != 0))
          d += 29
        else
          d += usual_calender[m-1]
        end
      elsif year == 1918
        # Neutral calender (1918)
        if (m == 2)
          d += 15
        else
          d += usual_calender[m-1]
        end
      end
    end


end

year = gets.strip.to_i
result = solve(year)
puts result;
