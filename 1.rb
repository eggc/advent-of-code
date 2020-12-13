require_relative "helper"

def solve(size)
  lines = read_lines("1.input.txt")
  lines.combination(size) do  |tuples|
    # puts "#{tuples.join('+')} = #{tuples.sum}"

    if tuples.sum == 2020
      return tuples.inject(:*)
    end
  end
end

puts solve(2)
puts solve(3)
