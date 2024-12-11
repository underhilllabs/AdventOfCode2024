FILE = "test.txt"
require_relative "trailhead"

map_file = File.open(FILE).readlines.map(&:chomp)
puts map_file
topo = Array.new(map_file[0].length){Array.new(map_file.count)}
trailheads = []
map_file.each_with_index do |row,y|
  row.split("").each_with_index do |num, x| 
    if num == "0"
      trailheads.push(Trailhead.new(x, y))
    end
    topo[y][x] = num.to_i
    
  end
end

puts "found trailheads: #{trailheads.to_a}"
