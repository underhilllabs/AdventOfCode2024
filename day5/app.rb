ORDER_FILE="input_page_order.txt"
UPDATE_FILE="input_update.txt"
# 47|53 47 is forbidden after 53
# 97|13
# 97|61
# 97|47
fa_pages = Hash.new{|h,k| h[k] = [] }

orders = File.open(ORDER_FILE).readlines.map(&:chomp)
# set up forbidden after pages
orders.each do |line|
  left, right = line.split("|").map(&:chomp)
  fa_pages[right.chomp].push(left)
end
  

puts fa_pages
updates = File.open(UPDATE_FILE).readlines
mids = []

def check_update(pages, fa_pages)
  pages.each do |p|
    haystack = pages.slice_after(p)
    next unless haystack.to_a[1]
    haystack.to_a[1].each do |needle|
      needle = needle.chomp
      # puts "checking if #{needle} is forbidden after #{p}"
      if fa_pages[p].member? needle
        puts "FAILED with #{needle} after #{p}"
        return false
      end
    end
  end 
  true
end


updates.each do |update|
  pages = update.split(",")
  puts "checking update #{update}"
  success = check_update(pages, fa_pages)
  if success 
    mids.append pages[pages.length/2]
    puts "taking mid #{pages[pages.length/2]} "
    puts "--- Successful update: #{update}" if success
  end
end  

puts "Q1: got #{mids.map(&:to_i).sum}"




