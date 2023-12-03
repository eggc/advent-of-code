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

    raise StandardError.new('Infinite loop!') if instraction.covered

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

  def run
    while(@program_counter < length) do
      step
    end

    @accumulator
  end

  # エラーがおきたらもとに戻してから再度エラーを出す。
  def try_repair(i)
    if switch_instraction(i)
      run
    end
  rescue StandardError
    @program_counter = 0
    @accumulator = 0
    @instractions.each { |instraction| instraction.covered = false }
    switch_instraction(i)
    false
  end

  def switch_instraction(i)

    instraction = @instractions[i]

    case instraction.operation
    when "jmp"
      instraction.operation = "nop"
    when "nop"
      instraction.operation = "jmp"
    end
  end

  def length
    @instractions.length
  end
end
