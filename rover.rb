class Rover

  def initialize()

    @current_x = 0
    @current_y = 0
    @current_direction = String.new
    @moves = String.new

  end

  def read_instruction
    puts "Please enter the current position and direction,eg.11N."
    puts "1st number being the x-coordinate, 2nd number is the y-coordinate"
    instructions = gets
    @current_x = instructions[0].to_i
    @current_y = instructions[1].to_i
    @current_direction = instructions[2]

    puts "Please enter the moves."
    @moves = gets
    puts @moves.length

    l = 0
    while l < @moves.length-1

      if @moves[l] != "M"
        turn(@moves[l])
      else
        move
      end

    l +=1
    puts l
    end

    return future_position

  end

  def move

        case @current_direction
        when "N"
          @current_y += 1
        when "E"
          @current_x += 1
        when "S"
          @current_y -= 1
        when "W"
          @current_x -= 1
        end

  end

  def turn(n)
    puts @current_direction
    case @current_direction
    when "N"
      if n == "L"
        @current_direction = "W"
      else
        @current_direction = "E"
      end
    when "E"
      if n == "L"
        @current_direction = "N"
      else
        @current_direction = "S"
      end
    when "S"
      if n == "L"
        @current_direction = "E"
      else
        @current_direction = "W"
      end
    when "W"
      if n == "L"
        @current_direction = "S"
      else
        @current_direction = "N"
      end

    end

  end

  def future_position
  puts "#{@current_x}#{@current_y}#{@current_direction}"
  end

end


#
# Taking It Further (optional)
#
# Try thinking about other object possibilities,
# such as a MissionControl object that's responsible for reading and handing the instructions over to the rovers.
# It could also be responsible for reporting their final states.
#
# Another possibility is a Plateau object.
# This object could give you perspective of multiple rovers on a given board.
# This could allow you to write methods to verify if the rovers are trying to move off the board or colliding with one another.
