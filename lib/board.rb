class Board
  attr_accessor :grid, :width, :height

  def initialize(width, height)
    @grid = [width, height]
    @width = width
    @height = height
  end
end
