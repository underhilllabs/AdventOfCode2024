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
fixed_mids = []
out_of_order = []

def check_update(pages, fa_pages)
  pages.each do |p|
    haystack = pages.slice_after(p)
    next if haystack.to_a[1].nil?
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
  else
    out_of_order.push(update.chomp)
  end
end

puts "Q1: got #{mids.map(&:to_i).sum}"
#puts "now work on: #{out_of_order}"

def check_and_shuffle_order(pages, fa_pages)
  pages.each_with_index do |p, idx1|
    haystack = pages.slice_after(p)
    next if haystack.to_a[1].nil?
    haystack.to_a[1].each_with_index do |needle, idx2|
      needle = needle.chomp
      if fa_pages[p].member? needle
        # 1. delete needle position
        pages.delete_at(idx1 + idx2 + 1)
        # 2. and then put needle in front of p
        pages.insert(idx1, needle)
        return false, pages
      end
    end
  end
  puts "fixed order!! #{pages}"
  return true, pages
end

#puts "now fix all of these {out_of_order}"
out_of_order.each do |ord|
  pages = ord.split(",")
  status = false
  while status == false do 
    status, pages = check_and_shuffle_order(pages, fa_pages)
  end
  # puts "correct order: #{pages}"
  fixed_mids.push(pages[pages.length/2])
end
puts "Q2: answer #{fixed_mids.map(&:to_i).sum}"
