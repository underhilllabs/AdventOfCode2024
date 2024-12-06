class Block
  attr_reader :lines, :max_x, :max_y, :count, :data
  def initialize(file)
    @lines = File.open(file).readlines.map(&:chomp)
    y = 0
    @data = Array.new(@lines[0].length){Array.new(@lines.count)}
    @lines.each_with_index do |line, y|
      line.split("").each_with_index do |char, x|
        @data[x][y] = char
      end
    end

    # puts "initialized #{@data}"
    @count = 0
    @max_x = lines[0].length
    puts lines[0]
    @max_y = lines.count
    puts "max_x: #{max_x}, max_y: #{max_y}" 
    find_starts
    # puts "cool test"
    # test(5,9)
    # puts "cooler test"
    # test(9,9)
    # puts "up #{check_up(9, 9)}"
    # puts "back #{check_back(9, 9)}"
    # puts "ul #{check_ul(9,9)}"
    # test(1,9)

    # test(3,9)
    # puts "test 3, 9"
    # puts check_ul(3,9)
    # puts check_ur(3,9)
    # puts test(4,0)
    # puts test(0,4)

    # test(5,9)
  end

  def test(x, y)
    count = check_all_xmas(x,y)
    puts "found #{count} at #{x} #{y}"
  end

  def find_starts
    y = 0
    lines.each_with_index do |line,y|
      line.split("").each_with_index do |char, x|
        if char == 'X'
          # puts "found char #{char} at [#{x},#{y}]" if char == "X" 
          # puts "count is currently #{count}"
          subcount = check_all_xmas(x, y)
          # puts "found char #{char} at [#{x},#{y}]" if char == "X" && subcount > 0
          puts "---found #{subcount} at #{x} #{y}" if subcount > 0
          @count += subcount
        end
      end
      y += 1
    end
    puts "found grand total count of #{count}"
	# puts print_loc(5, 9)
  end

  def check_all_xmas(x, y)
    loc_count = 0
    loc_count += 1 if check_forward(x, y)
    loc_count += 1 if check_back(x, y)
    loc_count += 1 if check_up(x, y)
    loc_count += 1 if check_down(x, y)
    loc_count += 1 if check_dr(x, y)
    loc_count += 1 if check_dl(x, y)
    loc_count += 1 if check_ur(x, y)
    loc_count += 1 if check_ul(x, y)                                                      
    loc_count
  end

  def check_forward(x, y)
    return if (x+3) >= max_x

    return data[x][y] == 'X' && data[x+1][y] == 'M' && data[x+2][y] == 'A' && data[x+3][y] == 'S'
  end

  def print_loc(x, y)
    puts "checking x {x}, y {y}"
    a = data[x][y]
    b = data[x+1][y]
    c = data[x+2][y]
    d = data[x+3][y]
    puts a, b, c, d
  end

  def check_back(x, y)
    return if (x-3) < 0

    return data[x][y] == 'X' && data[x-1][y] == 'M' && data[x-2][y] == 'A' && data[x-3][y] == 'S'
  end

  def check_down(x, y)
    return if (y+3) > max_y

    return data[x][y] == 'X' && data[x][y+1] == 'M' && data[x][y+2] == 'A' && data[x][y+3] == 'S'
  end

  def check_up(x, y)
    return if (y-3) < 0

    return data[x][y] == 'X' && data[x][y-1] == 'M' && data[x][y-2] == 'A' && data[x][y-3] == 'S'
  end

  def check_dl(x, y)
    return if (x-3) < 0 
    return if (y+3) >= max_y

    return data[x][y] == 'X' && data[x-1][y+1] == 'M' && data[x-2][y+2] == 'A' && data[x-3][y+3] == 'S'
  end

  def check_dr(x, y)
    return if (x+3) >= max_x 
    return if (y+3) >= max_y 

    return data[x][y] == 'X' && data[x+1][y+1] == 'M' && data[x+2][y+2] == 'A' && data[x+3][y+3] == 'S'
  end

  def check_ul(x, y)
    return if (x-3) < 0 
    return if (y-3) < 0 

    return data[x][y] == 'X' && data[x-1][y-1] == 'M' && data[x-2][y-2] == 'A' && data[x-3][y-3] == 'S'
  end

  def check_ur(x, y)
    return if (x+3) >= max_x
    return if (y-3) < 0

    return data[x][y] == 'X' && data[x+1][y-1] == 'M' && data[x+2][y-2] == 'A' && data[x+3][y-3] == 'S'
  end
end
