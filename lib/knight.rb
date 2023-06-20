require_relative 'board'

class Knight
  attr_accessor :coordinates

  def initialize(board, x = 0, y = 0)
    @board = board
    @coordinates = [x, y]
    @up_right = [x + 1, y + 2]
    @right_up = [x + 2, y + 1]
    @right_down = [x + 2, y - 1]
    @down_right = [x + 1, y - 2]
    @down_left = [x - 1, y - 2]
    @left_down = [x - 2, y - 1]
    @left_up = [x - 2, y + 1]
    @up_left = [x - 1, y + 2]
  end

  def knight_moves(start_coordinates, target_coordinates)
    return start_coordinates if start_coordinates == target_coordinates
    potential_moves(start_coordinates)

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

  def move_knight(coordinates)
    @coordinates = coordinates
    @up_right = [coordinates[0] + 1, coordinates[1] + 2]
    @right_up = [coordinates[0] + 2, coordinates[1] + 1]
    @right_down = [coordinates[0] + 2, coordinates[1] - 1]
    @down_right = [coordinates[0] + 1, coordinates[1] - 2]
    @down_left = [coordinates[0] - 1, coordinates[1] - 2]
    @left_down = [coordinates[0] - 2, coordinates[1] - 1]
    @left_up = [coordinates[0] - 2, coordinates[1] + 1]
    @up_left = [coordinates[0] - 1, coordinates[1] + 2]
  end

  def new_knight_moves(start_coordinates, target_coordinates)
    return if start_coordinates == target_coordinates || start_coordinates.nil? || target_coordinates.nil?

    potential_paths = [[start_coordinates]]
    while potential_paths.first.last != target_coordinates
      add_potential_path(potential_paths, @up_right) if on_board?(@up_right) && !potential_paths.first.include?(@up_right)
      return potential_paths.last if potential_paths.last.last == target_coordinates

      add_potential_path(potential_paths, @right_up) if on_board?(@right_up) && !potential_paths.first.include?(@right_up)
      return potential_paths.last if potential_paths.last.last == target_coordinates

      add_potential_path(potential_paths, @right_down) if on_board?(@right_down) && !potential_paths.first.include?(@right_down)
      return potential_paths.last if potential_paths.last.last == target_coordinates

      add_potential_path(potential_paths, @down_right) if on_board?(@down_right) && !potential_paths.first.include?(@down_right)
      return potential_paths.last if potential_paths.last.last == target_coordinates

      add_potential_path(potential_paths, @down_left) if on_board?(@down_left) && !potential_paths.first.include?(@down_left)
      return potential_paths.last if potential_paths.last.last == target_coordinates

      add_potential_path(potential_paths, @left_down) if on_board?(@left_down) && !potential_paths.first.include?(@left_down)
      return potential_paths.last if potential_paths.last.last == target_coordinates

      add_potential_path(potential_paths, @left_up) if on_board?(@left_up) && !potential_paths.first.include?(@left_up)
      return potential_paths.last if potential_paths.last.last == target_coordinates

      add_potential_path(potential_paths, @up_left) if on_board?(@up_left) && !potential_paths.first.include?(@up_left)
      return potential_paths.last if potential_paths.last.last == target_coordinates

      potential_paths.shift
      move_knight(potential_paths.first.last)
    end
  end

  def add_potential_path(potential_paths, coordinates)
    new_path = potential_paths.first + [coordinates]
    potential_paths << new_path
  end

  def on_board?(coordinates)
    (coordinates[0] >= 0 && coordinates[0] < @board.width) && (coordinates.last >= 0 && coordinates.last < @board.height)
  end

end