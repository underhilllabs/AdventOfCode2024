class Room
  attr_reader :room, :direction, :dir_x, :dir_y, :location
  def initialize(file)
    @direction = {n: {x: 0, y: -1}, s: {x: 0:, y: 1}, e: {x: -1, y: 0}, w: {x: 1, y: 0}}
    @room = build_room(file)
  end

  def build_room(file)
    lines = File.open(file).readlines.map(&:chomp)
    arr = Array.new(@lines[0].length){Array.new(@lines.count)}

    lines.each_with_index do |line, y|
      line.split("").each do |char, x|
        arr[x][y] = char
      end
    end
    puts "welcome to the dungeon"
    puts arr.map { |x| x.join(' ') }
    arr
  end

  def step
  end


  def look(x, y, dir)

  end
end

