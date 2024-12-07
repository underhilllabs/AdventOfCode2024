require_relative "cardinal"
class Person
  attr_reader :cardinal, :location, :current_direction, :dir_vector
  def initialize(x:, y:)
    @cardinal = Cardinal.new
    print "cardinals #{cardinal}"
    @location = {x: x,y: y} 
    @current_direction = :n
    @dir_vector = cardinal.direction(current_direction)
    puts "current direction is #{current_direction}"
    puts "current direction vectore is #{dir_vector}"
    puts "location is #{location}"
  end

  def look(room)
    y = location[:y] + dir_vector[:y]
    x = location[:x] + dir_vector[:x]
    # return false unless on_board?(x, y, room)

    room.room[location[:y] + dir_vector[:y] ][location[:x] + dir_vector[:x]]
  end

  def on_board?(x, y, map)
    map.print_map(map.room)
    puts 
    max_y = map.room.length
    max_x = map.room[0].length
    return x  > 0 && y > 0 && x < max_x && y < max_y
  end

  def is_in_room?(map)
    map.print_map(map.room)
    max_y = map.room.length
    max_x = map.room[0].length
    return location[:x] > 0 && location[:y] > 0 && location[:x] < max_x && location[:y] < max_y
  end

  def is_on_border?(map)
    max_y = map.room.count
    max_x = map.room[0].length
    next_x = location[:x] + dir_vector[:x]
    next_y = location[:y] + dir_vector[:y]
    puts "next_x #{next_x}, next_y #{next_y}, max_x #{max_x} max_y #{max_y}"
    return next_x < 0 || next_y < 0 || next_x >= max_x || next_y >= max_y
  end

  def move(room)
    old_x = @location[:y]
    old_y = @location[:y]
    @location[:x] = location[:x] + dir_vector[:x]
    @location[:y] = location[:y] + dir_vector[:y]
  end

  # change
  def turn_right
    new_dir = case current_direction
    when :n
      :e
    when :e
      :s
    when :s
      :w
    when :w
      :n
    end
    card = cardinal.direction(new_dir)
    puts "new_dir is #{new_dir} => #{card}"
    x = card[:x]
    y = card[:y]
    @dir_vector[:x] = x
    @dir_vector[:y] = y
    @current_direction = new_dir
    puts "now facing #{current_direction} new dir_vector #{dir_vector}"
  end
end
