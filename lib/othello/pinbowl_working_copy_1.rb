#!/bin/ruby
# coding : utf-8
#===============================================================================
# system require
#===============================================================================
require "logger"
require './bowling.rb'
# Code Sample - 1.1
# Simulate Reversi game known as Othello too
#===============================================================================
# class:: This is the class to output log
# author:: Rajesh Vyas
# date:: 2018-03-15
# version:: 1.0
# copyright:: cookievagabond@2018
#===============================================================================
ROWSIZE = 2     # Board Size
COLSIZE = 21    # Board Size
PINROW = 0 # First row display pins
TOTALROW = 1 # First row display pins
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
# class:: This is the class to implement othello game
# author:: Rajesh Vyas
# date:: 2018-03-15
# version:: 1.0
# copyright:: cookievagabond@2018
#===============================================================================
class GameMainClass
	#=============================================================================
	# brief:: This is main function where we manage board and total
	#=============================================================================
	def mainFunction
		board = Array.new(ROWSIZE) { Array.new(COLSIZE, ' ' )} #  The board
		total = Array.new(ROWSIZE) { Array.new(COLSIZE, ' ' )} #  Valid total
    frames = Array.new(FRAMEROW){Array.new(FRAMECOL, 0)}
    single_turns_arr = []
    last_turns_arr = []
    turn_total = []
    game_total = 0
		no_of_moves = 0                                   #  Count of total
		invalid_moves = 0                                 #  Invalid move count
		player = 0                                        #  Player indicator
		begin
      puts("\n WELCOME TO GAME REVERSI \n")
      puts("***** TWO PLAYER BLACK [B] AND WHITE [W] *****\n")
      puts("***** BLACK => B WHITE => W *****\n")
      puts("*****PLAY BY SELECTING SQURE OF YOUR MOVE BY INSERTING X AND Y CORDINATES WITH SPACE *****\n\n")
      # Initialize board layout and maximum posible move in the game
      board = intialize_result(board)
      # Display header row
      display_header
      # Testing display frame
			display(board)

      # Get input for each ball
      sum = trow = tcol = 0
      # for col in 0...COLSIZE
      (0...COLSIZE).each_with_index do | col, index |
        if single_turns_arr.length == 2
          last_sum = single_turns_arr.inject(0){|sum,x| sum + x }
          single_turns_arr.clear
        end

        # $stdin.flush
        puts("\n")

        # Input pin data
        pin_down = input_data(single_turns_arr, last_sum, col)

        puts("\n")
        # sum += pin_down.to_i
        board[PINROW][col] = pin_down

        single_turns_arr << pin_down.to_i

        # $stdin.flush
        frames[trow][tcol] = pin_down.to_i

        tcol += 1
        if single_turns_arr.length == 2
          trow += 1
          tcol = 0
        end

        if single_turns_arr.length == 2
          turn_total, game_total = game_score(frames)
        end

        # Display header row
        display_header
			  display(board)
        display_score(turn_total)

        # Calculation for 10th frame
        if col == COLSIZE - 1
          partial_total = 0
          turn_total, game_total = game_score(frames)
          turn_total.each_with_index {|t, index| partial_total += t if index < 9 }
          current_turn = game_total - partial_total
          result(current_turn, true)
        end
      end

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
    if col > 19
      return 0 if tenth_frame_sum < 10
    end

    begin
      print "\nEnter knocked pins numbers: [#{col}]"
      if col < 19
        return 0 if frame_total == 10
      end
      pin_down = gets.strip
      pin_down = Integer(pin_down)
      # raise if (frame_total + pin_down) > 10
      if col < 19
        # Total of frame should not exceed 10
        raise if (frame_total + pin_down) > 10
      else
        # Total of pin should not exceed 10
        raise if pin_down > 10
      end
    rescue
      print "[Knocked pins numbers must be integer]"
      print "\n[Max Knocked pins in a frame can not exceed 10 apart from bonus frame]"
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
  # brief:: This function will print print total score of the game
  #=============================================================================
  def result(grand, bonusf)
    number_of_pins = '%7.7s' % grand
    if bonusf
      number_of_pins = '%11.11s' % grand
    end
    # number_of_pins = '%8.8s' % grand
    print("#{number_of_pins}|")
  end

  #=============================================================================
  # brief:: This function will print score of each frame
  #=============================================================================
  def display_score(scores)
    scores.each_with_index do | s, index |
      number_of_pins = '%7.7s' % s
      if index > 8
      # if index == scores.length - 1 && index > 8
        # Last frame is wider with max three column
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
        print("F+#{frame_nums}|")
      when 18
        # 10th Frame
        frame_nums = '%11.11s' % "#{frame_count}"
        print("#{frame_nums}|")
      when 20
        # Game total Frame
        frame_nums = '%7.7s' % "SCORE"
        print("#{frame_nums}|")
      else
        print("#{frame_nums}|")
      end
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
          if col == 20
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
l_obj = GameMainClass.new
l_obj.mainFunction
