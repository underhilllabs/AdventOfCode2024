# Cardinals = {n: {x: 0, y: -1}, s: {x: 0, y: 1}, e: {x: 1, y: 0}, w: {x: -1, y: 0}}
class Cardinal
  def direction(dir)
    case dir
    when :n
      north
    when :s
      south
    when :e
      east
    when :w
      west
    end
  end

  def north
    {x: 0, y: -1}
  end

  def south
    {x: 0, y: 1}
  end

  def east
    {x: 1, y: 0}
  end

  def west
    {x: -1, y: 0}
  end
end
