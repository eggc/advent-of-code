require_relative '../helper'
require_relative 'program'
require_relative 'instraction'

def solve(input_file_name)
  program = Program.new(input_file_name)
  loop do
    program.step
  end
rescue StandardError
  program.accumulator
end

puts solve('8/sample.txt')
puts solve('8/input.txt')
