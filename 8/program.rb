class Program
  attr_reader :accumulator

  def initialize(input_file_name)
    @accumulator = 0
    @program_counter = 0
    @instractions = each_lines(input_file_name).map do |line|
      operation, argument = line.split(' ')
      Instraction.new(operation, argument)
    end
  end

  def step
    instraction = @instractions[@program_counter]

    raise StandardError('Infinite loop!') if instraction.covered

    instraction.covered = true

    case instraction.operation
    when "acc"
      @accumulator += instraction.argument.to_i
      @program_counter += 1
    when "nop"
      @program_counter += 1
    when "jmp"
      @program_counter += instraction.argument.to_i
    end
  end
end
