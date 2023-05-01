# frozen_string_literal: true

module Play
  def show_game_board
    puts " #{@board[0..2].join(' | ')}"
    puts " #{@board[3..5].join(' | ')}"
    puts " #{@board[6..8].join(' | ')}"
  end

  def location_taken?(index)
    if @board[index - 1] == 'X' || @board[index - 1] == 'O'
      true
    else
      false
    end
  end

  def winner_check
    if horizontal_win('X') || cross_win('X') || vertical_win('X')
      puts 'Player 1 wins'
      show_game_board
      true
    elsif horizontal_win('O') || cross_win('O') || vertical_win('O')
      puts 'Player 2 wins'
      show_game_board
      true
    elsif @board.all? { |elements| elements.is_a? String }
      puts 'Draw'
      show_game_board
      true
    else
      false
    end
  end

  def horizontal_win(player_sign)
    if @board[0..2].all?(player_sign) || @board[3..5].all?(player_sign) || @board[6..8].all?(player_sign)
      true
    else
      false
    end
  end

  def cross_win(player_sign)
    if @board[0] == player_sign && @board[4] == player_sign && @board[8] == player_sign
      true
    elsif @board[2] == player_sign && @board[4] == player_sign && @board[6] == player_sign
      true
    else
      false
    end
  end

  def vertical_win(player_sign)
    if @board[0] == player_sign && @board[3] == player_sign && @board[6] == player_sign
      true
    elsif @board[1] == player_sign && @board[4] == player_sign && @board[7] == player_sign
      true
    elsif @board[2] == player_sign && @board[5] == player_sign && @board[8] == player_sign
      true
    else
      false
    end
  end

  def input_check?(input)
    if !input.between?(1, 9) || location_taken?(input)
      true
    else
      false
    end
  end

  def player1_turn
    loop do
      show_game_board
      player1_input = gets.chomp.to_i
      if input_check?(player1_input)
        puts 'INVALID INPUT'
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
      player2_input = gets.chomp.to_i
      if input_check?(player2_input)
        puts 'INVALID INPUT'
        next
      else
        @board[player2_input - 1] = 'O'
        break
      end
    end
  end

  def play_round
    loop do
      puts 'Player 1 choose a location to place your X'
      player1_turn
      break if winner_check

      puts 'Player 2 choose a location to place your O'
      player2_turn
      break if winner_check
    end
  end
end

class GameBoard
  include Play

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end
end
