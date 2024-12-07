# Dungeon Crawler
require_relative "person"
require_relative "room"

room = Room.new("input.txt")
row, col = room.find_guard
guard = Person.new(x: col, y: row)

while guard.is_in_room?(room) do
  if guard.is_on_border?(room) == true
    ahead = false
  else
    ahead = guard.look(room) 
  end
  puts "looked ahead #{ahead}"
  if ahead == '#'
    guard.turn_right 
    puts "turning right!!"
    room.print_map(room.room)
  elsif ahead == false
    #guard.move(room)
    room.mark_location(guard.location, 'X')
    break
  end
  room.mark_location(guard.location, 'X')
  break unless guard.is_in_room? room
  guard.move(room) 
  room.mark_location(guard.location, '^')
end

room.print_map(room.room)
room.count_trail(room.room)
