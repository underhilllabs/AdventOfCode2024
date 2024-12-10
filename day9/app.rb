FILE = "input.txt"
file_map = File.open(FILE).readlines.map(&:chomp).join("")
#puts file_map
instructions = file_map.split("")
fragmented_disk = [] 

def repeat(text, n)
  text.to_s * n.to_i
end
puts file_map
odd_counter = 0
instructions.each_with_index do |instruction, index|
  # odd: length of file (00, 111, 2222)
  # even: length of free space (fill with 'xxx'?)
  if index.even?
    str = repeat(odd_counter.to_s, instruction)
    fragmented_disk.push(str)
    odd_counter += 1
  else
    str = repeat('.', instruction)
    fragmented_disk.push(str)
  end
end
fragmented_disk= fragmented_disk.join("")
#puts fragmented_disk

puts "defrag in process"

def defrag(str)
  f_str = str.split("")
  free_space = str.scan(".").count
  total_free_space = free_space
 # puts "found  #{free_space} free space"
  b_str = str.gsub(".","").split("")
  defrag_str = Array.new(str.length, '.')
  f_str.each_with_index do |char, index|
    count_to_end = defrag_str.length - index
  #  puts "count to end #{count_to_end}"
    break if count_to_end <= total_free_space
    break if free_space <= 0
    if char == "."
      next_char = b_str.pop
   #   puts "next char #{next_char} in index #{index} and free space #{free_space}"
      defrag_str[index] = next_char
      free_space -= 1
      # b_str.push(".")
    else
      defrag_str[index] = char
    end
    #puts defrag_str.join
  end
  defrag_str.join
end

defragged = defrag(fragmented_disk)
puts defragged.split("").map.with_index{|d, idx|  d.to_i * idx}.sum
puts "checksum"