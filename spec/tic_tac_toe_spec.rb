# frozen_string_literal: true

require_relative '../tic_tac_toe'
# Write tests for your Tic Tac Toe project. In this situation, it’s not quite as simple as just coming up with inputs
# and making sure the method returns the correct thing.
# You’ll need to make sure the tests that determine victory or loss conditions are correctly assessed.

# Start by writing tests to make sure players win when they should, e.g. when the board reads X X X across the top row,
# your #game_over method (or its equivalent) should trigger.

# Test each of your critical methods to make sure they function properly and handle edge cases.

# Use mocks/doubles to isolate methods to make sure that they’re sending back the right outputs.

describe GameBoard do
# tests to make sure players win when they should
  describe '#winner_check' do
    subject(:game) { described_class.new }

    before do
      allow(game).to receive(:puts)
    end

    context 'when X wins horizontal' do
      it 'first row' do
        game.instance_variable_set(:@board, ['X', 'X', 'X', 4, 5, 6, 7, 8, 9])
        expect(game.winner_check).to eq(true)
      end

      it 'second row' do
        game.instance_variable_set(:@board, [1, 2, 3, 'X', 'X', 'X', 7, 8, 9])
        expect(game.winner_check).to eq(true)
      end
      it 'third row' do
        game.instance_variable_set(:@board, [1, 2, 3, 4, 5, 6, 'X', 'X', 'X'])
        expect(game.winner_check).to eq(true)
      end
    end

    context 'when O wins horizontal' do
      it 'first row' do
        game.instance_variable_set(:@board, ['O', 'O', 'O', 4, 5, 6, 7, 8, 9])
        expect(game.winner_check).to eq(true)
      end

      it 'second row' do
        game.instance_variable_set(:@board, [1, 2, 3, 'O', 'O', 'O', 7, 8, 9])
        expect(game.winner_check).to eq(true)
      end
      it 'third row' do
        game.instance_variable_set(:@board, [1, 2, 3, 4, 5, 6, 'O', 'O', 'O'])
        expect(game.winner_check).to eq(true)
      end
    end

    context 'when X wins cross' do
      it 'first shape' do
        game.instance_variable_set(:@board, ['X', 2, 3, 4, 'X', 6, 7, 8, 'X'])
        expect(game.winner_check).to eq(true)
      end

      it 'second shape' do
        game.instance_variable_set(:@board, [1, 2, 'X', 4, 'X', 6, 'X', 8, 9])
        expect(game.winner_check).to eq(true)
      end
    end

    context 'when O wins cross' do
      it 'first shape' do
        game.instance_variable_set(:@board, ['O', 2, 3, 4, 'O', 6, 7, 8, 'O'])
        expect(game.winner_check).to eq(true)
      end

      it 'second shape' do
        game.instance_variable_set(:@board, [1, 2, 'O', 4, 'O', 6, 'O', 8, 9])
        expect(game.winner_check).to eq(true)
      end
    end

    context 'when X wins vertical' do
      it 'first row' do
        game.instance_variable_set(:@board, ['X', 2, 3, 'X', 5, 6, 'X', 8, 9])
        expect(game.winner_check).to eq(true)
      end

      it 'second row' do
        game.instance_variable_set(:@board, [1, 'X', 3, 4, 'X', 6, 7, 'X', 9])
        expect(game.winner_check).to eq(true)
      end
      it 'third row' do
        game.instance_variable_set(:@board, [1, 2, 'X', 4, 5, 'X', 7, 8, 'X'])
        expect(game.winner_check).to eq(true)
      end
    end

    context 'when O wins vertical' do
      it 'first row' do
        game.instance_variable_set(:@board, ['O', 2, 3, 'O', 5, 6, 'O', 8, 9])
        expect(game.winner_check).to eq(true)
      end

      it 'second row' do
        game.instance_variable_set(:@board, [1, 'O', 3, 4, 'O', 6, 7, 'O', 9])
        expect(game.winner_check).to eq(true)
      end
      it 'third row' do
        game.instance_variable_set(:@board, [1, 2, 'O', 4, 5, 'O', 7, 8, 'O'])
        expect(game.winner_check).to eq(true)
      end
    end

    context 'when board is full' do
      it 'returns true' do
        game.instance_variable_set(:@board, ['X', 'O', 'X', 'O', 'X', 'O', 'O', 'X', 'O'])
        expect(game.winner_check).to eq(true)
      end
    end

    context 'when there is no winner or draw' do
      it 'returns false' do
        game.instance_variable_set(:@board, [1, 'X', 3, 4, 5, 6, 'O', 8, 9])
        expect(game.winner_check).to eq(false)
      end
    end
  end

  describe '#location_taken?' do
    subject(:game) { described_class.new }

    before do
      game.instance_variable_set(:@board, [1, 'X', 3, 4, 'X', 'O', 'O', 8, 9])
    end
    context 'when location is taken' do
      it 'returns true when 2 is taken' do
        expect(game.location_taken?(2)).to eq(true)
      end

      it 'returns true when 7 is taken' do
        expect(game.location_taken?(7)).to eq(true)
      end
    end

    context 'when location is not taken' do
      it 'returns false when 1 is not taken' do
        expect(game.location_taken?(1)).to eq(false)
      end
    end
  end

  describe '#input_check?' do
    subject(:game) { described_class.new }

    before do
      game.instance_variable_set(:@board, [1, 'X', 3, 4, 'X', 'O', 'O', 8, 9])
    end

    context 'when player enters valid input' do
      it 'returns false when input is integer 9' do
        expect(game.input_check?(3)).to eq(false)
      end

      it 'returns false when input is integer 1' do
        expect(game.input_check?(4.0)).to eq(false)
      end
    end

    context 'when player enters invalid input' do
      it 'returns true when input is 10' do
        expect(game.input_check?(10)).to eq(true)
      end

      it 'returns true when input is -2' do
        expect(game.input_check?(-2)).to eq(true)
      end

      it 'returns true when location is taken' do
        expect(game.input_check?(2)).to eq(true)
      end
    end
  end

  describe '#player1_turn' do
    subject(:game) { described_class.new }

    context 'when player1 enters valid input' do
      before do
        allow(game).to receive(:puts)
      end

      it 'updates board[1] with X when input is 2' do
        allow(game).to receive(:gets).and_return('2')
        game.player1_turn
        board = game.instance_variable_get(:@board)
        expect(board[1]).to eq('X')
      end
    end

    context 'when player1 enters invalid input then valid' do
      before do
        allow(game).to receive(:gets).and_return('@', '2')
      end

      it 'prints "INVALID INPUT" then changes board[1] to X' do
        expect { game.player1_turn }.to output(" 1 | 2 | 3\n 4 | 5 | 6\n 7 | 8 | 9\nINVALID INPUT\n 1 | 2 | 3\n 4 | 5 | 6\n 7 | 8 | 9\n").to_stdout
        board = game.instance_variable_get(:@board)
        expect(board[1]).to eq('X')
      end
    end
  end
end
