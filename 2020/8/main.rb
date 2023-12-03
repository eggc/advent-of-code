require_relative '../helper'
require_relative 'program'
require_relative 'instraction'

def solve_1(input_file_name)
  program = Program.new(input_file_name)
  program.run
rescue StandardError
  program.accumulator
end

def solve_2(input_file_name)
  program = Program.new(input_file_name)
  program.length.times.each do |i|
    result = program.try_repair(i)
    return result if result
  end
end

puts solve_1('8/sample.txt')
puts solve_1('8/input.txt')
puts solve_2('8/sample.txt')
puts solve_2('8/input.txt')
