require "test/unit"

require "dictionary"

class TestDictionary < Test::Unit::TestCase
  def test_index
    dict = Dictionary.new("dict.txt")
    assert(dict["foo"], "Has foo")
    assert(!dict["fred"], "Doesn't have fred")
  end
  
  def test_has_prefix
    dict = Dictionary.new("dict.txt")
    assert(dict.has_prefix?("fo"), "has fo prefix")
    assert(dict.has_prefix?("foo"), "has foo prefix")
    assert(!dict.has_prefix?("ab"), "Failure message.")
  end
end