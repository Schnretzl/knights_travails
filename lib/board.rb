class Board
  attr_accessor :grid

  def initialize(width, height)
    @grid = [width, height]
  end
end
