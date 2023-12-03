require 'pry'

def read_lines(input_file_name)
  [].tap do |numbers|
    File.foreach("#{__dir__}/#{input_file_name}") do |line|
      numbers << line.to_i
    end
  end
end


# 空行によって区切られた文字列をグループに分解して返す
def read_groups(input_file_name)
  temporary_lines = []
  lines = each_lines(input_file_name).map { |line| line }
  lines << "" # 終端記号として空行を入れておく
  lines.each.with_index.with_object([]) do |(line, i), groups|
    if line.strip.empty?
      groups << temporary_lines
      temporary_lines  = []
    else
      temporary_lines << line.strip
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
