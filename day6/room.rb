# !!! Important
# !!! you are reading in the map row by row, col by col.
# !!!  Therefore you need to index the matrix by [row][col] or [y][x] NOT [x][y]
class Room
  attr_reader :room, :direction, :dir_x, :dir_y, :location
  def initialize(file)
    @direction = {n: {x: 0, y: -1}, s: {x: 0, y: 1}, e: {x: -1, y: 0}, w: {x: 1, y: 0}}
    @room = build_room(file)
  end

  def build_room(file)
    lines = File.open(file).readlines.map(&:chomp)
    arr = Array.new(lines[0].length){Array.new(lines.count)}

    lines.each_with_index do |line, row|
      puts line
      line.split("").each_with_index do |char, col|
        arr[row][col] = char
      end
    end

    puts "welcome to the dungeon"
    print_map(arr)

    puts
    puts "guard is at: #{arr[6][4]}"
    arr
  end

  def mark_location(location, char)
    @room[location[:y]][location[:x]] = char
  end

  def print_map(arr)
    arr.each_with_index do |row,y|
      puts row.join(" ")
    end
  end

  def find_guard
    room.each_with_index do |row, y|
      row.each_with_index do |char, x|
        return y, x if char == '^'
      end
    end
  end
end

