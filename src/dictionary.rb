class Dictionary
  def initialize(file)
    @file = file
    # NB: We have to have both prefixes and dictionary so that we can tell
    # whether a word exists or not.  The prefix hash alone is insufficient.
    @dict = {}
    File.foreach(file) do |line|
      @dict[line.chomp] = true
    end
    _assign_prefixes
  end
  
  def has_prefix?(prefix)
    return @prefixes.has_key?(prefix)
  end
  
  def [](word)
    return @dict[word]
  end
  
  private
  
  def _assign_prefixes
    @prefixes = Hash.new(0)
    @dict.each_key do |word|
      (0...word.length).each do |n|
        prefix = word[0..n]
        @prefixes[prefix] += 1
      end
    end
  end
  
end