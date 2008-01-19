require "test/unit"

require "tile"

class TestTile < Test::Unit::TestCase
  def test_basic
    tile = Tile.new(0,0,"a")
    assert_equal(0, tile.x)
    assert_equal(0, tile.y)
    assert_equal("a", tile.letter)
  end
  
  def assert_neighbours(expected, x, y)
    tile = Tile.new(x,y,"a")
    assert_equal(expected, tile.neighbours)
  end
  
  def test_neighbours_1_1
    expected = [
      [0,0], [0,1], [0,2],
      [1,0],        [1,2],
      [2,0], [2,1], [2,2],
    ]
    assert_neighbours(expected, 1, 1)
  end
  
  def test_neighbours_0_0
    expected = [
             [0,1],
      [1,0], [1,1]
    ]
    assert_neighbours(expected, 0, 0)
  end
  
  def test_neighbours_3_3
    expected = [
      [2,2],[2,3],
      [3,2]
    ]
    assert_neighbours(expected, 3, 3)
  end
  
  def test_equals
    t1 = Tile.new(0,0,"a")
    t2 = Tile.new(0,0,"a")
    assert_equal(t1, t2)
  end
  
  def test_to_s
    t = Tile.new(0,0,"a")
    assert_equal("a[0,0]", t.to_s)
  end
  
  def test_qu
    t = Tile.new(0,0,"q")
    assert_equal("q[0,0]", t.to_s)
    assert_equal("qu", t.letter)
  end
end