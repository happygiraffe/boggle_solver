# $Id$

require "tile"

class Board
  def initialize(tiles)
    @board = []
    # Convert each letter into a Tile which knows its position.
    tiles.each_with_index do |letter, i|
      x = (i / 4)
      y = i % 4
      @board[x] ||= []
      @board[x][y] = Tile.new(x,y,letter)
    end
  end
  
  def to_s
    return @board.map do |row|
       row.map { |t| t.letter }.join(" ")
    end.join("\n")
  end
  
  def [](x,y)
    return @board[x][y]
  end
  
  # Iterate over each tile in turn, top-to-bottom, left-to-right.
  def each_tile
    @board.each do |row|
      row.each do |tile|
        yield tile
      end
    end
  end
  
  def neighbours_of(t)
    return t.neighbours.map do |point|
      x, y = *point
      @board[x][y]
    end
  end
end
