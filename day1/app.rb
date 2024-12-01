col1 = []
col2 = []
total_count = 0

test_input = "3   4
4   3
2   5
1   3
3   9
3   3"

lines = File.readlines("input.txt").each_with_index do |line, idx|
# lines = test_input.split("\n").each_with_index do |line, idx|
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
  puts "row #{idx} got #{diff} from #{higher} - #{lower}"
  sum = sum + diff
end
puts "found: sum #{sum}"
puts "#{total_count} lines in input"

total_scores = 0
col1.each do |num|
  count = 0
  col2.each do |num2|
    count = count + 1 if num2 == num
  end
  sim_score = count * num.to_i
  puts "found similarity score of #{sim_score} for #{num}"
  total_scores = total_scores + sim_score
end
puts "#{total_scores} score in input"
