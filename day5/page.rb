class Page
  ORDER_FILE = "test_page_order.txt"
  attr_reader :name, :forbidden_before, :forbidden_after 
  def initialize(num)
    @name = num
    @forbidden_after = []
    page_order = File.open(ORDER_FILE).readlines
    set_ordering(page_order)
  end

  def set_ordering(page_order)
    # 47|53 53 cannot be printed before 47
    #       47 cannot be printed AFTER 53
    # 97|13
    # 97|61
    page_order.each do |line|
      left, right = line.split("|")
      @forbidden_before.append(right) if left == name
      @forbidden_after.append(left) if right == name
    end

    def after_correct?(list)
      list.each do |num| 
        return false if @forbidden_after.include? num 
      end
      true
    end
  end
end