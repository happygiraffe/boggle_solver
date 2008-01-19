# http://www.mh-z.com/untangle/
# $Id$

class Solver
  def initialize(board, dict)
    @board = board
    @dict = dict
  end
  
  def all_words
    words = []
    @board.each_tile do |t|
      words += explore_path([t])
    end
    return words.sort.uniq
  end
  
  def explore_path(path)
    # It's called word, but it might be a prefix of a word.
    word = prefix_of(path)

    # No point continuing unless it's in the dictionary.
    return [] unless @dict.has_prefix?(word)

    # Pull out all neighbour tiles we haven't yet seen.
    neighbours = @board.neighbours_of(path[-1]) - path

    # If we get this far, we might well be looking at a valid word.
    words = []
    words << word if @dict[word] && word.length > 2

    # Check each of our neighbours for further words.
    neighbours.each do |t|
      # Create a new path by appending this neighbour.
      new_path = path.dup << t
      words += explore_path(new_path)
    end
    return words
  end
  
  private
  
  def prefix_of(path)
    return path.map { |t| t.letter }.join("")
  end
end