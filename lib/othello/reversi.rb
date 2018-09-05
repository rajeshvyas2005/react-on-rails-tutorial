#!/bin/ruby
# coding : utf-8
#===============================================================================
# system require
#===============================================================================
require "logger"
# Code Sample - 1.1
# Simulate Reversi game known as Othello too
#===============================================================================
# class:: This is the class to output log
# author:: Rajesh Vyas
# date:: 2018-03-15
# version:: 1.0
# copyright:: cookievagabond@2018
#===============================================================================
SIZE = 8        # Board Size
BLACKDISK = "B" # Black Disk
WHITEDISK = "W" # White Disk
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
	# brief:: This is main function where we manage board and moves
	#=============================================================================
	def mainFunction
		board = Array.new(SIZE) { Array.new( SIZE, ' ' )} #  The board
		moves = Array.new(SIZE) { Array.new( SIZE, ' ' )} #  Valid moves
		no_of_moves = 0                                   #  Count of moves
		invalid_moves = 0                                 #  Invalid move count
		player = 0                                        #  Player indicator
		begin
      puts("\n WELCOME TO GAME REVERSI \n")
      puts("***** TWO PLAYER BLACK [B] AND WHITE [W] *****\n")
      puts("***** BLACK => B WHITE => W *****\n")
      puts("*****PLAY BY SELECTING SQURE OF YOUR MOVE BY INSERTING X AND Y CORDINATES WITH SPACE *****\n")
      # Initialize board layout and maximum posible move in the game
      board, l_max_moves = intialize_result(board)

			# Loop through maximum moves limit
			while no_of_moves < l_max_moves  do
				# Display the board
				display(board)
				player = player + 1
				l_count = 0
				# Confirming odd and even moves.
				if(player % 2) != 0
					# Black player turn
					l_count, moves = valid_moves(board, moves, BLACKDISK)
					# Play for valid moves
					if l_count > 0
            board, moves, no_of_moves = play_valid_move(board, moves, no_of_moves, BLACKDISK)
					else
            invalid_moves, no_of_moves = play_invalid_move(invalid_moves, l_max_moves)
					end
				else
					# White player turn
					l_count, moves = valid_moves(board, moves, WHITEDISK)
					# Play for valid moves
					if l_count > 0
            board, moves, no_of_moves = play_valid_move(board, moves, no_of_moves, WHITEDISK)
					else
            invalid_moves, no_of_moves = play_invalid_move(invalid_moves, l_max_moves)
					end
				end
			end

      puts("\n*****FINAL BOARD POSITION IS SHOWN BELOW*******\n")
      game_result(board)
		rescue Exception => e
      MyLog.log.error "Failed to execute main function ERROR: #{e}"
		end
	end

  #=============================================================================
  # brief:: This function will initialize board layout
  #=============================================================================
  def intialize_result(board)
    puts("\nENTER MAX MOVE IN THE GAME\n")
    l_max_moves = gets.to_i
    if(l_max_moves == 0)
      puts("Enter correct maximum count.\n")
      return raise "Enter correct maximum count"
    end

    puts("\nMAX MOVE IS:" + l_max_moves.to_s)

    # Blank all the board squares
    for row in 0..SIZE-1
      for col in 0..SIZE-1
        board[row][col] = ' '
      end
    end

    # Place the initial four counters in the center
    board[SIZE/2 - 1][SIZE/2 - 1] = board[SIZE/2][SIZE/2] = WHITEDISK
    board[SIZE/2 - 1][SIZE/2] = board[SIZE/2][SIZE/2 - 1] = BLACKDISK

    return board, l_max_moves
  end

  #=============================================================================
  # brief:: This function will play valid move for the game
  #=============================================================================
  def play_valid_move(board, moves, no_of_moves, disktype)
    # Read player moves until a valid move is entered
    while true
      # Flush the keyboard buffer
      $stdout.flush
      puts("\n[#{disktype}][MOVE NUMBER:#{no_of_moves+1}] Enter Row Number[x] SPACE Column Number[y]")

      #Check input data
      x, y = gets.chomp.split(" ").map(&:to_i)
      if(x == nil || y == nil)
        puts("[Must enter row and column with space]\n")
        next
      end
      x = x - 1  # Convert to row index
      y = y - 1  # Convert to colun index

      if(x >= 0 && y >= 0 && x < SIZE && y < SIZE && moves[x][y] > 0)
        make_move(board, x, y, disktype)
        # Increment move count
        no_of_moves = no_of_moves + 1
        break
      else
        # Flush the keyboard buffer
        $stdin.flush
        puts("Not a valid move, please try again.\n")
        next
      end
    end
    return board, moves, no_of_moves
  end

  #=============================================================================
  # brief:: This function will play invalid move for the game
  #=============================================================================
  def play_invalid_move(invalid_moves, l_max_moves)
    # Not valid moves
    invalid_moves = invalid_moves + 1
    if invalid_moves < 2
      # Flush the keyboard buffer
      $stdin.flush
      printf("\nYou have to pass, press return");
    else
      # Break the game
      no_of_moves = l_max_moves
      printf("\nNeither of us can go, so the game is over.\n");
    end
    return invalid_moves, no_of_moves
  end

  #=============================================================================
  # brief:: This function will give you final game reult
  #=============================================================================
  def game_result(board)
    # Show final board
    display(board)
    # Get final scores and display them
    black_score = white_score = 0
    for row in 0..SIZE-1
      for col in 0..SIZE-1
        # For black
        if board[row][col] == BLACKDISK
          black_score = black_score + 1
        end

        # For white
        if board[row][col] == WHITEDISK
          white_score = white_score + 1
        end
      end
    end

    puts("\nBLACK [B] COUNTS: " + black_score.to_s)
    puts("WHITE [W] COUNTS: " + white_score.to_s)
    if black_score > white_score
      puts("HEY CONGRATES BLACK [B] WIN\n")
    elsif black_score < white_score
      puts("HEY CONGRATES WHITE [W] WIN\n")
    else
      puts("HUMMM !! UNFORTUNATELY MATCH TIE\n")
    end
  end

	#=============================================================================
	# brief:: This function will print board data
	#=============================================================================
	def display(board)
		row  = 0       # Row index
		col = 0        # Column index
		col_label = 1  # Column label

		#Start top line
		puts("\n ")

		#Display the top line
		print(" ")
		for col in 0..SIZE-1
			#Display the top line
			print("   " + (col_label + col).to_s)
		end

		#End the top line
		print("\n")

		# Display the intermediate rows *
		for row in 0..SIZE-1
			print("  +")
			for col in 0..SIZE-1
				print("---+")
			end
			l_temp = row + 1
			print("\n " + l_temp.to_s + "|")

			for col in 0..SIZE-1
				# Display counters in row
				print(board[row][col] + "  |")
			end
			print("\n")
		end

		# Start the bottom line
		print("  +")
		for col in 0..SIZE-1
			# Display the bottom line
			print("---+")
		end
		# End the bottom  line
		print("\n")
	end

	#=============================================================================
	# brief:: This function will check for valid move
	#=============================================================================
	def valid_moves(board, moves, player)
		rowdelta = 0     # Row increment around a square
		coldelta = 0     # Column increment around a square
		row = 0          # Row index
		col = 0          # Column index
		x = 0            # Row index when searching
		y = 0            # Column index when searching
		no_of_moves = 0  # Number of valid moves

		# Set the opponent
		opponent = (player == WHITEDISK)? BLACKDISK : WHITEDISK

		# Initialize moves array to zero
		for row in 0..SIZE-1
			for col in 0..SIZE-1
				moves[row][col] = 0
			end
		end

		# Find squares for valid moves.
		# A valid move must be on a blank square and must enclose
		# at least one opponent square between two player squares

		for row in 0..SIZE-1
			for col in 0..SIZE-1
				if(board[row][col] != ' ')  # Is it a blank square?
					next                      # No - so on to the next
				end

				# Check all the squares around the blank square
				# for the opponents counter
				rowdelta = -1
				while rowdelta <= 1
					coldelta = -1
					while coldelta <= 1
						# Don't check outside the array, or the current square
						if(row + rowdelta < 0 || row + rowdelta >= SIZE ||col + coldelta < 0 || col + coldelta >= SIZE || (rowdelta==0 && coldelta==0))
							coldelta = coldelta + 1
							next
						end

						# Now check the square
						if(board[row + rowdelta][col + coldelta] == opponent)
							# If we find the opponent, move in the delta direction
							# over opponent counters searching for a player counter
							x = row + rowdelta   # Move to
							y = col + coldelta   # opponent square

							# Look for a player square in the delta direction
							while true
								x = x + rowdelta   # Go to next square
								y = y + coldelta   # in delta direction

								# If we move outside the array, give up
								if(x < 0 || x >= SIZE || y < 0 || y >= SIZE)
									break
								end

								# If we find a blank square, give up
								if(board[x][y] == ' ')
									break
								end
								#  If the square has a player counter
								#  then we have a valid move
								if(board[x][y] == player)
									# Mark as valid
									moves[row][col] = 1
									# Increase valid moves count
									no_of_moves = no_of_moves + 1
									# Go check another square
									break
								end

							end
						end
						coldelta = coldelta + 1
					end
					rowdelta = rowdelta + 1
				end
			end
		end
		return no_of_moves, moves
	end

	#=============================================================================
	# brief:: This function execute move part
	#=============================================================================
	def make_move(board, row, col, player)
		rowdelta = 0        # Row increment
		coldelta = 0        # Column increment
		x = 0               # Row index for searching
		y = 0               # Column index for searching

		# Identify opponent
		opponent = (player == WHITEDISK)? BLACKDISK : WHITEDISK

		# Place the player counter
		board[row][col] = player

		# Check all the squares around this square
	 	# for the opponents counter
		rowdelta = -1
		while rowdelta <= 1
			coldelta = -1
			while coldelta <= 1
				# Don't check off the board, or the current square
				if(row + rowdelta < 0 || row + rowdelta >= SIZE ||col + coldelta < 0 || col + coldelta >= SIZE || (rowdelta==0 && coldelta== 0))
					coldelta = coldelta + 1
					next
				end

				# Now check the square
				if(board[row + rowdelta][col + coldelta] == opponent)
					# If we find the opponent, search in the same direction
					# for a player counter
					x = row + rowdelta        # Move to opponent
					y = col + coldelta        # square

					while true
						x = x + rowdelta        # Move to the
						y = y + coldelta        # next square

						# If we are off the board give up
						if(x < 0 || x >= SIZE || y < 0 || y >= SIZE)
							break
						end

						# If the square is blank give up
						if(board[x][y] == ' ')
							break
						end

						# If we find the player counter, go backwards from here
						# changing all the opponents counters to player
						if(board[x][y] == player)
							# Opponent?
							while(board[x-=rowdelta][y-=coldelta]==opponent)
								# Yes, change it
								board[x][y] = player
							end
							# We are done
							break
						end
					end
				end
				coldelta = coldelta + 1
			end
			rowdelta = rowdelta + 1
		end
	end
end

#===============================================================================
# Test from command prompt
#===============================================================================
l_obj = GameMainClass.new
l_obj.mainFunction
