class Report
  MAX = 3
  MIN = 1 
  attr_reader :levels, :direction
  def initialize(levels)
    @levels = levels.split.map(&:to_i)
    @direction = set_direction
  end
  
  def check_levels?
    case direction
    when :decreasing
      check_decrease
    when :increasing
      check_increase
    else
      false
    end
  end

  def set_direction
    first, second = levels.first(2)
    # puts "first #{first} second #{second}"
    dir = first - second
    # puts "dir is #{dir}"
    return :decreasing if dir > 0
    return :increasing if dir < 0
    return nil if dir == 0
  end

  def check_decrease
    current = levels.first
    levels.drop(1).each do |level|
      step = current - level
      # puts "checking #{current} decreasing from #{level}: step is #{step}"
      return nil unless (step >= MIN && step <= MAX)
      current = level
    end
    true
  end

  def check_increase
    current = levels.first
    levels.drop(1).each do |level|
      step = level - current
      # puts "checking #{current} increasing from #{level}: step is #{step}"

      return nil unless (step >= MIN && step <= MAX)
      current = level
    end
    true 
  end

  def safe?
    check_levels?
  end
end
