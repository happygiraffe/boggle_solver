#!/usr/bin/ruby

require 'board'
require 'dictionary'
require 'solver'

letters = %w[a b c d e f g h i j k l m n o p]

board = Board.new(letters)
dict = Dictionary.new('/usr/share/dict/words')
solver = Solver.new(board, dict)
solver.all_words.each { |w| puts w }
