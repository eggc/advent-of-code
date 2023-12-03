require_relative '../helper'
require_relative 'xmas'
require_relative 'weekness_finder'

def solve_1(input_file_name, preamble_count)
  xmas = Xmas.new(input_file_name, preamble_count)
  xmas.run
  xmas.error_numbers
end

def solve_2(input_file_name, preamble_count)
  finder = WeeknessFinder.new(input_file_name, preamble_count)
  finder.run
  finder.weekness_numbers
end

puts solve_1('9/sample.txt', 5)
puts solve_1('9/input.txt', 25)
puts solve_2('9/sample.txt', 5)
puts solve_2('9/input.txt', 25)
