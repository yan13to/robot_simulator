class RobotSimulator
  def initialize
    @x, @y, @facing = nil, nil, nil
    @table = { min_x: 0, min_y: 0, max_x: 4, max_y: 4 }
  end

  def place(x, y, facing)
    if valid_position?(x, y) && ['NORTH', 'SOUTH', 'EAST', 'WEST'].include?(facing)
      @x, @y, @facing = x, y, facing
    end
  end

  def move
    case @facing
    when 'NORTH'
      @y += 1 if valid_position?(@x, @y + 1)
    when 'SOUTH'
      @y -= 1 if valid_position?(@x, @y - 1)
    when 'EAST'
      @x += 1 if valid_position?(@x + 1, @y)
    when 'WEST'
      @x -= 1 if valid_position?(@x - 1, @y)
    end
  end

  def left
    case @facing
    when 'NORTH' then @facing = 'WEST'
    when 'WEST' then @facing = 'SOUTH'
    when 'SOUTH' then @facing = 'EAST'
    when 'EAST' then @facing = 'NORTH'
    end
  end

  def right
    case @facing
    when 'NORTH' then @facing = 'EAST'
    when 'EAST' then @facing = 'SOUTH'
    when 'SOUTH' then @facing = 'WEST'
    when 'WEST' then @facing = 'NORTH'
    end
  end

  def report
    if @x && @y && @facing
      puts "Output: #{@x}, #{@y}, #{@facing}"
    end
  end

  private

  def valid_position?(x, y)
    x.between?(@table[:min_x], @table[:max_x]) && y.between?(@table[:min_y], @table[:max_y])
  end
end

# Example usage
robot = RobotSimulator.new
robot.place(0, 0, 'NORTH')
robot.move
robot.report
robot.left
robot.report

