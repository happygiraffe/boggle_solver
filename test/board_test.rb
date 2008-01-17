require "test/unit"

require "board"

class TestBoard < Test::Unit::TestCase
  def setup
    @letters = %w[a b c d e f g h i j k l m n o p]
    @board = Board.new(@letters)
  end

  def test_to_s
    assert_equal(<<BOARD.chomp, @board.to_s)
a b c d
e f g h
i j k l
m n o p
BOARD
  end
  
  def test_index
    assert_equal("a", @board[0,0].letter)
    assert_equal("k", @board[2,2].letter)
    assert_equal("p", @board[3,3].letter)
  end
  
  # Check we can get each tile out in the order that it came in.
  def test_each_tile
    tiles = []
    @board.each_tile { |t| tiles << t.letter }
    assert_equal(@letters, tiles)
  end
  
  def test_neighbours_of
    t = @board[0,0]
    neighbours = @board.neighbours_of(t).map { |nt| nt.to_s }
    expected = ["b[0,1]", "e[1,0]", "f[1,1]"]
    assert_equal(expected, neighbours)
  end
end