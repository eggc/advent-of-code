require_relative '../helper'
require_relative 'xmas'

def solve_1(input_file_name, preamble_count)
  xmas = Xmas.new(input_file_name, preamble_count)
  xmas.run
  xmas.error_numbers
end

def solve_2(input_file_name)
end

puts solve_1('9/sample.txt', 5)
puts solve_1('9/input.txt', 25)
