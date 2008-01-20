#!/usr/bin/ruby

require 'board'
require 'dictionary'
require 'solver'

def usage
  $stderr.puts("usage: #{File.basename($0)} letters")
  exit(2)
end

#letters = %w[a b c d e f g h i j k l m n o p]
letters = ARGV.join(' ').split(/\s+/)
usage unless letters.size == 16

puts ">> #{Time.now}: Making board."
board = Board.new(letters)
puts ">> #{Time.now}: Making dictionary."
dict = Dictionary.new('/usr/share/dict/words')
puts ">> #{Time.now}: Making Solver."
solver = Solver.new(board, dict)
puts ">> #{Time.now}: Solving."
solver.all_words.each { |w| puts w }
puts ">> #{Time.now}: Done."
