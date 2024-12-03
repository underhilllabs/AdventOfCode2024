# FILE="test.txt"
# FILE="input.txt"
FILE="input.txt"
DEBUG = false

data = File.open(FILE).readlines
puts "starting data: #{data}" if DEBUG

process_data = data.join

re = /mul\(\d+,\d+\)|don\'t\(\)|do\(\)/
nums = []
flagged = false
process_data.scan(re).each do |str|
  puts "current str #{str}" if DEBUG
  flagged = true if str == "don't()"
  flagged = false if str == "do()"
  puts "skipping because in don't() loop" if flagged == true and DEBUG
  next if flagged
  mults = str.scan(/\d+/)
  puts "found #{mults}" if DEBUG
  nums.append(mults[0].to_i * mults[1].to_i) if mults.respond_to?('each')
end

puts "Question 2: #{nums.sum}"
