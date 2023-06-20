require_relative 'lib/knight'

board = Board.new(8, 8)
knight = Knight.new(board)

p knight.new_knight_moves([0, 0], [7, 7])