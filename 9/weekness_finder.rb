class WeeknessFinder
  attr_reader :weekness_numbers

  def initialize(file_name, preamble_count)
    @numbers = each_lines(file_name).map(&:to_i)
    @error_number = find_error_number(file_name, preamble_count)
    @weekness_numbers = []
  end

  def run
    while(!@numbers.empty?) do
      find_weekness
      @numbers.shift
    end
  end

  def find_weekness
    return if @numbers[0] == @error_number

    sum = 0
    i = 0

    while(sum < @error_number) do
      sum += @numbers[i]
      i += 1
    end

    if sum == @error_number
      smallest = @numbers[0...i].min
      largest = @numbers[0...i].max

      @weekness_numbers << smallest + largest
    end
  end

  def find_error_number(file_name, preamble_count)
    xmas = Xmas.new(file_name, preamble_count)
    xmas.run
    xmas.error_numbers.first
  end
end
