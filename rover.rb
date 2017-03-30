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
    puts @moves[@moves.length]

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
    #magic spell
    direction_spell = "WNESWN"
    substring_index = direction_spell[1..-2].index(@current_direction)
    if n == "L"
      position = -1
    else
      position = 1
    end
    @current_direction = direction_spell[substring_index+1+position]

  end

  def future_position
  puts "#{@current_x}#{@current_y}#{@current_direction}"
  end

end
