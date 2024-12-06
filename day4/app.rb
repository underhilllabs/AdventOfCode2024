require_relative 'block'
FILE = "input.txt"
data = File.open(FILE).readlines

block = Block.new(FILE)

