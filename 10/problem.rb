class Problem
  def initialize(input_file_name)
    @adapters = each_lines(input_file_name).map(&:to_i).sort
    @differences = [nil, 0, 0, 0]
    @jolt = 0
  end

  def step
    diff = @adapters.shift - @jolt
    @differences[diff] += 1
    @jolt += diff
  end

  def solve
    while(!@adapters.empty?) do
      step
    end

    @differences[3] += 1
    @jolt += 3

    @differences[1] * @differences[3]
  end
end
