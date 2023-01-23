# class GameBoard will house the array
# class playround will start the game
# class players will keep tally of score
module Play
  def show_game_board
    puts " #{@board[0..2].join(' | ')}"
    puts " #{@board[3..5].join(' | ')}"
    puts " #{@board[6..8].join(' | ')}"
  end

  def location_taken?(index)
    if @board[index - 1] == 'X' || @board[index - 1] == 'O'
      puts 'Please choose a different location'
      true
    else
      false
    end
  end

  def player1_turn
    loop do
      show_game_board
      puts 'Player 1 choose a location to place your X'
      player1_input = gets.chomp.to_i
      if !player1_input.between?(1, 9) || location_taken?(player1_input)
        puts 'Please enter a number between 1..9'
        next
      else
        @board[player1_input - 1] = 'X'
        break
      end
    end
  end

  def player2_turn
    loop do
      show_game_board
      puts 'Player 2 choose a location to place your O'
      player2_input = gets.chomp.to_i
      if !player2_input.between?(1, 9) || location_taken?(player2_input)
        puts 'Please enter a number between 1..9'
        next
      else
        @board[player2_input - 1] = 'O'
        break
      end
    end
  end

  def play_round
    loop do
      player1_turn
      player2_turn
    end
  end
end

class GameBoard
  include Play

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end
end

game = GameBoard.new
game.play_round
