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
    prefix = prefix_of(path)
    # puts ">> explore_path prefix=#{prefix}"

    # No point continuing unless it's in the dictionary.
    return [] unless @dict.has_prefix?(prefix)

    # Pull out all neighbour tiles we haven't yet seen.
    neighbours = @board.neighbours_of(path[-1]) - path

    # If we get this far, we might well be looking at a valid word.
    words = []
    words << prefix if @dict[prefix] && prefix.length > 2

    # Check each of our neighbours for further words.
    neighbours.each do |t|
      # Create a new path by appending this neighbour.
      new_path = path.dup << t
      words += explore_path(new_path)
    end
    # puts "<< explore_path prefix=#{prefix} words=#{words.join(' ')}"
    return words
  end
  
  private
  
  def prefix_of(path)
    return path.map { |t| t.letter }.join("")
  end
end