def read_lines(input_file_name)
  [].tap do |numbers|
    File.foreach("#{__dir__}/#{input_file_name}") do |line|
      numbers << line.to_i
    end
  end
end
