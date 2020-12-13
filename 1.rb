def read_lines
  [].tap do |numbers|
    File.foreach("#{__dir__}/1.input.txt") do |line|
      numbers << line.to_i
    end
  end
end

def solve(size)
  lines = read_lines
  lines.combination(size) do  |tuples|
    # puts "#{tuples.join('+')} = #{tuples.sum}"

    if tuples.sum == 2020
      return tuples.inject(:*)
    end
  end
end

puts solve(2)
puts solve(3)
