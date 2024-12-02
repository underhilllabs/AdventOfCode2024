FILE = "input.txt"
require_relative 'report'

safe_count = 0
lines = File.open(FILE).readlines
lines.each do |line|
  report = Report.new(line)
  safe_count += 1 if report.safe?
end
puts "safe count: #{safe_count}"
