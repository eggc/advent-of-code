class Problem2
  def initialize(input_file_name)
    @adapters = each_lines(input_file_name).map(&:to_i).sort
    @cache = []
  end

  def solve(jolt = 0, adapters = @adapters)
    return 1 if jolt >= @adapters.last

    3.times.sum do |i|
      next_jolt = i + 1 + jolt

      if adapters.include?(next_jolt)
        remain_adapters = adapters.dup
        remain_adapters.delete(next_jolt)
        @cache[next_jolt] ||= solve(next_jolt, remain_adapters)
      else
        0
      end
    end
  end
end
