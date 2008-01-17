require "test/unit"

require "board"
require "dictionary"
require "solver"

class TestSolver < Test::Unit::TestCase
  def setup
    letters = %w[
      a b c d
      e f g h
      i j k l
      m n o p
    ]
    @board = Board.new(letters)
    @dict = Dictionary.new('test/dict.txt')
  end

  def test_explore_path
    solver = Solver.new(@board, @dict)
    # Start looking at k[2,2] n[3,1] in order to get "knife".
    path = [@board[2,2], @board[3,1]]
    words = solver.explore_path(path)
    expected = %w[ knife ]
    assert_equal(expected, words)
  end
end