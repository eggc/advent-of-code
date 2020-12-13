def read_lines(input_file_name)
  [].tap do |numbers|
    File.foreach("#{__dir__}/#{input_file_name}") do |line|
      numbers << line.to_i
    end
  end
end

def each_lines(input_file_name, &block)
  if block_given?
    File.foreach("#{__dir__}/#{input_file_name}") do |line|
      yield(line)
    end
  else
    File.foreach("#{__dir__}/#{input_file_name}")
  end
end
