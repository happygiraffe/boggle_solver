#!/usr/bin/ruby

# Ruby.
require 'optparse'

# App.
require 'board'
require 'dictionary'
require 'solver'

def usage
  $stderr.puts(<<USAGE)
usage: #{File.basename($0)} [-d dictfile] letters
NB: You must supply 16 letters in left-to-right, top-to-bottom order.
NB: "q" is treated as "qu".
USAGE
  exit(2)
end

options = {
  :dictfile => "/usr/share/dict/words", 
}
letters = []
begin
  OptionParser.new do |op|
    op.on('-d') do |val|
      options[:dictfile] = val
    end
  end.parse!
  letters = ARGV.join(' ').split(/\s+/)
rescue OptionParser::InvalidOption => e
  usage
end
usage unless letters.size == 16

puts ">> #{Time.now}: Making board."
board = Board.new(letters)
puts ">> #{Time.now}: Making dictionary."
dict = Dictionary.new(options[:dictfile])
puts ">> #{Time.now}: Making Solver."
solver = Solver.new(board, dict)
puts ">> #{Time.now}: Solving."
solver.all_words.each { |w| puts w }
puts ">> #{Time.now}: Done."
