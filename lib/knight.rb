require_relative 'board'

class Knight
  attr_accessor :coordinates

  def initialize(board)
    @board = board
  end
end

public

def knight_moves(start_coordinates, target_coordinates)
  return start_coordinates if start_coordinates == target_coordinates

  path_arr = [start_coordinates]
  unless start_coordinates[0] >= @board.width - 1 || start_coordinates[1] >= @board.height - 1  # up right
    path_arr << knight_moves([start_coordinates[0] + 1, start_coordinates[1] + 2], target_coordinates)
    return path_arr if path_arr[path_arr.length - 1] == target_coordinates
  end
  unless start_coordinates[0] >= @board.width - 2 || start_coordinates[1] >= @board.height - 2  # right up
    path_arr += knight_moves([start_coordinates[0] + 2, start_coordinates[1] + 1], target_coordinates)
    return path_arr if path_arr[path_arr.length - 1] = target_coordinates
  end
  unless start_coordinates[0] >= @board.width - 2 || start_coordinates[1] <= 1                  # right down
    path_arr += knight_moves([start_coordinates[0] + 2, start_coordinates[1] - 1], target_coordinates)
    return path_arr if path_arr[path_arr.length - 1] = target_coordinates
  end
  unless start_coordinates[0] >= @board.width - 1 || start_coordinates[1] <= 0                  # down right
    path_arr += knight_moves([start_coordinates[0] + 1, start_coordinates[1] - 2], target_coordinates)
    return path_arr if path_arr[path_arr.length - 1] = target_coordinates
  end
  unless start_coordinates[0] <= 1 || start_coordinates[1] <= 0                                 # down left
    path_arr += knight_moves([start_coordinates[0] - 1, start_coordinates[1] - 2], target_coordinates)
    return path_arr if path_arr[path_arr.length - 1] = target_coordinates
  end
  unless start_coordinates[0] <= 0 || start_coordinates[1] <= 1                                 # left down
    path_arr += knight_moves([start_coordinates[0] - 2, start_coordinates[1] - 1], target_coordinates)
    return path_arr if path_arr[path_arr.length - 1] = target_coordinates
  end
  unless start_coordinates[0] <= 0 || start_coordinates[1] >= @board.height - 2                 # left up
    path_arr += knight_moves([start_coordinates[0] - 2, start_coordinates[1] + 1], target_coordinates)
    return path_arr if path_arr[path_arr.length - 1] = target_coordinates
  end
  unless start_coordinates[0] <= 1 || start_coordinates[1] >= @board.height - 1                 # up left
    path_arr += knight_moves([start_coordinates[0] - 1, start_coordinates[1] + 2], target_coordinates)
    return path_arr if path_arr[path_arr.length - 1] = target_coordinates
  end

end
