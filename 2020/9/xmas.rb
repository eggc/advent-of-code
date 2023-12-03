# 設問の意味がわかりにくいのでメモ
# 入力は暗号化された数字列
# 入力は XMAS という暗号化システムでエンコードされている
# XMAS は preamble という 25個の数を送信する
# そのあと受け取る数字は、直前の25個の数のうち2個の和でなければならない
# 和をなす2個の数は異なる数である。そのような組は1つ以上あるかもしれない
class Xmas
  attr_reader :error_numbers

  def initialize(file_name, preamble_count)
    @error_numbers = []
    @preamble_count = preamble_count
    @preambles = []
    @rest = []

    each_lines(file_name).with_index do |line, i|
      if i < @preamble_count
        @preambles << line.to_i
      else
        @rest << line.to_i
      end
    end
  end

  def run
    while(!@rest.empty?) do
      step
    end
  end

  def step
    number = @rest.shift
    unless valid_number?(number)
      @error_numbers << number
    end

    @preambles.shift
    @preambles << number
  end

  def valid_number?(number)
    @preambles.combination(2).map(&:sum).include?(number)
  end
end
