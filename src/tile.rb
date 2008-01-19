# $Id$

class Tile
  MAX_X = 3
  MAX_Y = 3
  attr_reader :x,:y

  def initialize(x, y, letter)
    @x = x
    @y = y
    @letter = letter
  end

  # Return the stored letter.  Except if it's a "q", we return "qu".
  # Them's the rules.
  def letter
    case @letter
    when "q"
      return "qu"
    else
      return @letter
    end
  end
  
  # List all the surrounding neighbours for a tile.  They are listed in
  # top-to-bottom, left-to-right order.
  def neighbours
    neighbours = []
    [@x-1, @x, @x+1].each do |x|
      [@y-1, @x, @y+1].each do |y|
        if x >= 0 && y >= 0 && x <= MAX_X && y <= MAX_Y && !(x == @x && y == @y)
          neighbours << [x,y]
        end
      end
    end
    return neighbours
  end
  
  def ==(other)
    return other.x == @x && other.y == @y && other.letter == @letter
  end
  
  def to_s
    return "#{@letter}[#{@x},#{@y}]"
  end
end