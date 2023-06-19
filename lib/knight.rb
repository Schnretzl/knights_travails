require_relative 'board'

class Knight
  attr_accessor :coordinate

  def initialize(coordinate)
    @coordinate = coordinate
    @board = board
  end
end
