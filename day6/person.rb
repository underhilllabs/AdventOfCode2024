class Person
  attr_reader :cardinals, :location, :current_direction, :dir_vector
  def initialize(x, y)
    @cardinals = {n: {x: 0, y: -1}, s: {x: 0:, y: 1}, e: {x: -1, y: 0}, w: {x: 1, y: 0}}
    @location = {x: x,y: y} 
    @current_direction = :n
    @dir_vector = @cardinals[@current_direction]
    puts "current direction is #{current_direction}"
    puts "current direction vectore is #{dir_vector}"
    puts "location is #{location}"
  end

  def look(room)
    room[location[:x] + dir_vector[:x] ][location[:y] + dir_vector[:y]]
  end

  def move(room)
    old_x = @location[:y]
    old_y = @location[:y]
    @location[:x] = location[:x] + dir_vector[:x]
    @location[:y] = location[:y] + dir_vector[:y]
  end

  # change
  def turn_right(new_direction)
    @dir_vector[:x] = new_direction[:x]
    @dir_vector[:y] = new_direction[:y]
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
    @current_direction = new_dir
    puts "now facing #{@current_direction}"
  end
end
