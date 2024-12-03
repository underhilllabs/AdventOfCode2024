FILE="input.txt"
DEBUG = nil

data = File.open(FILE).readlines
puts "starting data: #{data}" if DEBUG

process_data = data.join

re = /mul\(\d+,\d+\)/
nums = []
process_data.scan(re).each do |str|
  mults = str.scan(/\d+/)
  puts "found #{mults}" if DEBUG
  nums.append(mults[0].to_i * mults[1].to_i)
end

puts "Question 1: #{nums.sum}"
