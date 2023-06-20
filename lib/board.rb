class Board
  attr_accessor :grid, :width, :height

  def initialize(width, height)
    @grid = [width, height]
    @width = width
    @height = height
    @visited = []
  end

  def visit(x, y)
    @visited += [x, y]
  end

  def visited?(x, y)
    include?([x, y])
  end
end
