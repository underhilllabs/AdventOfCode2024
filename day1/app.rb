FILE = "test.txt"
# FILE = "input.txt"

col1 = []
col2 = []
total_count = 0


lines = File.readlines(FILE).each_with_index do |line, idx|
  col1[idx], col2[idx] = line.split
  total_count = total_count + 1
end

col1.sort!
col2.sort!
sum = 0
abs_sum = 0
col1.each_with_index do |c1, idx|
  lower,higher = [c1.to_i,col2[idx].to_i].sort
  
  diff = higher - lower
  puts "DEBUG: row #{idx} got #{diff} from #{higher} - #{lower}"
  sum = sum + diff
end

puts
puts "Question 1:"
puts "sum #{sum}"
puts

total_scores = 0
col1.each do |num|
  count = 0
  col2.each do |num2|
    count = count + 1 if num2 == num
  end
  sim_score = count * num.to_i
  puts "DEBUG: found similarity score of #{sim_score} for #{num}"
  total_scores = total_scores + sim_score
end
puts
puts "Question 2:"
puts "sum #{total_scores}"
