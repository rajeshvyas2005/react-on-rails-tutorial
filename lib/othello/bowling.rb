#!/bin/ruby
# coding : utf-8
#===============================================================================
# System require
#===============================================================================
require "logger"
require './bowling_game.rb'
# Code Sample - 1.1
# Simulate Bowling Game in RUBY
#===============================================================================
# class:: This is the class to output log
# author:: Rajesh Vyas
# date:: 2018-03-26
# version:: 1.0
# copyright:: cookievagabond@2018
#===============================================================================
ROWSIZE = 2
COLSIZE = 21
PINROWINDEX = 0
TOTALROW = 1
FRAMEROW  = 11
FRAMECOL = 2
class MyLog
  def self.log
    if @log.nil?
      @log = Logger.new STDOUT
      @log.level = Logger::DEBUG
      @log.datetime_format = '%Y-%m-%d %H:%M:%S'
    end
    @log
  end
end

#===============================================================================
# class:: This is the main class to implement Bowling Game
# author:: Rajesh Vyas
# date:: 2018-03-26
# version:: 1.0
# copyright:: cookievagabond@2018
#===============================================================================
class BowlingMainClass
	#=============================================================================
	# brief:: This is main function where we manage knocked pins board and score
	#=============================================================================
	def mainFunction
		board = Array.new(ROWSIZE) { Array.new(COLSIZE, ' ' )}
		total = Array.new(ROWSIZE) { Array.new(COLSIZE, ' ' )}
    frames = Array.new(FRAMEROW){Array.new(FRAMECOL, 0)}
    single_turns_arr = turn_total = []
    game_total = last_sum = trow = tcol = 0
		begin
      puts("\n WELCOME TO BOWLING GAME \n")
      puts("***** PLEASE ENTER NUMBER OF KNOCKED PINS *****\n")
      puts("***** ROW HEADER MEANING F|[FRAME NUMBER] P|[KNOCKED PINS] T|[FRAME TOTAL] *****\n")
      puts("***** COL HEADER MEANING FRAME NUMBERS 1~10 AND GAME SCORE *****\n")
      puts("***** LAST COLUMN = TOTAL GAME SCORE *****\n\n")
      # Initialize board layout with empty data
      board = intialize_result(board)
      # Display header row with board
      display_header
			display(board)

      # Loop through the game
      (0...COLSIZE).each_with_index do | col, index |
        if single_turns_arr.length == 2
          last_sum = single_turns_arr.inject(0){|sum,x| sum + x }
          single_turns_arr.clear
        end

        puts("\n")
        # Get input for each ball
        pin_down = input_data(single_turns_arr, last_sum, col)
        puts("\n")

        board[PINROWINDEX][col] = pin_down
        single_turns_arr << pin_down.to_i

        frames[trow][tcol] = pin_down.to_i
        tcol += 1
        if single_turns_arr.length == FRAMECOL
          trow += 1
          tcol = 0
        end

        if single_turns_arr.length == FRAMECOL
          turn_total, game_total = game_score(frames)
        end

        # Display header row
        display_header
			  display(board)
        display_score(turn_total)

        # Calculation for 10th frame
        if col == COLSIZE - 1
          sub_total = 0
          turn_total, game_total = game_score(frames)
          turn_total.each_with_index {|t, index| sub_total += t if index < 9 }
          last_frame_total = game_total - sub_total
          # Print last frame score
          result(last_frame_total, true)
        end
      end
      # Print game score
      result(game_total, false)
		rescue Exception => e
      MyLog.log.error "Failed to execute main function ERROR: #{e}"
		end
	end

  #=============================================================================
  # brief:: This function will get game score
  #=============================================================================
  def input_data(single_turns_arr, tenth_frame_sum, col)
    frame_total = single_turns_arr.inject(0){|sum,x| sum + x }
    if col > (COLSIZE - 2)
      return 0 if tenth_frame_sum < (FRAMEROW - 1)
    end

    begin
      print "\nEnter knocked pins numbers: "
      if col < (COLSIZE - 2)
        return 0 if frame_total == (FRAMEROW - 1)
      end
      pin_down = gets.strip
      pin_down = Integer(pin_down)
      if col < (COLSIZE - 2)
        # Total of frame should not exceed 10
        raise if (frame_total + pin_down) > (FRAMEROW - 1)
      else
        # Total of pin should not exceed 10
        if frame_total < (FRAMEROW - 1)
          raise if (frame_total + pin_down) > (FRAMEROW - 1)
        end

        # Max pins are 10
        raise if pin_down > (FRAMEROW - 1)

        # last ball was open ball
        if tenth_frame_sum < 20
          raise if (tenth_frame_sum - 10 + pin_down) > (FRAMEROW - 1)
        end
      end
    rescue
      print "[Knocked pins numbers must be integer]"
      print "\n[Max Knocked pins in a frame can not exceed 10 apart from bonus frame, Check rules in wiki!!]"
      retry
    end
    pin_down
  end

  #=============================================================================
  # brief:: This function will get game score
  #=============================================================================
  def game_score(arr)
    game = BowlingGame.new(*arr)
    eachturn, score = game.scorer
    return eachturn, score
  end

  #=============================================================================
  # brief:: This function will initialize board layout
  #=============================================================================
  def intialize_result(board)
    # Blank all the board squares
    for row in 0..ROWSIZE-1
      for col in 0..COLSIZE-1
        board[row][col] = ' '
      end
    end
    board
  end

  #=============================================================================
  # brief:: This function will print result column
  #=============================================================================
  def result(grand, bonusf)
    number_of_pins = '%7.7s' % grand
    if bonusf
      number_of_pins = '%11.11s' % grand
    end
    print("#{number_of_pins}|")
  end

  #=============================================================================
  # brief:: This function will print score of each frame
  #=============================================================================
  def display_score(scores)
    scores.each_with_index do | s, index |
      number_of_pins = '%7.7s' % s
      if index > 8
        number_of_pins = '%11.11s' % s
      end
      print("#{number_of_pins}|")
    end
  end

  #=============================================================================
	# brief:: This function will print header line
	#=============================================================================
  def display_header
    frame_count = 1
    #Display the header line
    print(" ")
    for col in 0..COLSIZE-1
      if col % 2 != 0
        next
      end

      frame_nums = '%7.7s' % "#{frame_count}"
      # Display the top frame line
      case col
      when 0
        # 1st Frame
        print("F|")
      when 18
        # 10th Frame
        frame_nums = '%11.11s' % "#{frame_count}"
      when 20
        # Game total Frame
        frame_nums = '%7.7s' % "SCORE"
      end
      print("#{frame_nums}|")
      frame_count += 1
    end
    #End the header line
    print("\n")
  end

	#=============================================================================
	# brief:: This function will print board data
	#=============================================================================
	def display(board)
		# Display the intermediate rows *
		for row in 0..ROWSIZE-1
			print("  +")
			for col in 0..COLSIZE-1
        print("---+")
        if col == 18
          print("---+---+")
        end
			end
      row_title = (row % 2 == 0) ? "P" : "T"
			print("\n #{row_title}|")

      # Print each frame pins on first row
      if row % 2 == 0
  			for col in 0..COLSIZE-1
          number_of_pins = '%2.2s' % board[row][col]
          print(" " + number_of_pins + "|")
          if col == (COLSIZE - 1)
            print('%9.9s' % "TOTAL|\n")
          end
  			end
      end
		end
	end

end

#===============================================================================
# Test from command prompt
#===============================================================================
l_obj = BowlingMainClass.new
l_obj.mainFunction
