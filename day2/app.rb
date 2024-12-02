FILE = "input.txt"
require_relative 'report'

safe_count = 0
lines = File.open(FILE).readlines

lines.each do |line|
  report = Report.new(line)
  safe_count += 1 if report.safe?
end
puts "Question 1:"
puts "----------------"
puts "safe count: #{safe_count}"
puts

safe_count = 0
lines.each do |line|
  report = Report.new(line)
  safe_count += 1 if report.any_safe?
end
puts "Question 2:"
puts "----------------"
puts "safe count: #{safe_count}"
