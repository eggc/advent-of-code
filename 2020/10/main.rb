require_relative '../helper'
require_relative 'problem'
require_relative 'problem2'


def solve_1(input_file_name)
  problem = Problem.new(input_file_name)
  problem.solve
end

def solve_2(input_file_name)
  problem = Problem2.new(input_file_name)
  problem.solve
end

puts solve_1('10/sample.txt')
puts solve_1('10/input.txt')
puts solve_2('10/sample.txt')
puts solve_2('10/input.txt')
