# FILE="test.txt"
# FILE="input.txt"
FILE="input.txt"
DEBUG = false

data = File.open(FILE).readlines

process_data = data.join

re = /mul\(\d+,\d+\)|don\'t\(\)|do\(\)/
nums = []
flagged = false
process_data.scan(re).each do |str|
  flagged = true if str == "don't()"
  flagged = false if str == "do()"
  next if flagged
  mults = str.scan(/\d+/)
  nums.append(mults[0].to_i * mults[1].to_i) if mults.respond_to?('each')
end

puts "Question 2: #{nums.sum}"
