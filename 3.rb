require_relative "helper"

class Map
  def initialize(lines)
    @rows = []

    lines.each_with_index do |line, y|
      line.strip.split("").each_with_index do |letter, x|
        @rows[y] ||= []
        @rows[y][x] = letter
      end
    end
  end

  def get(x, y)
    # 添字範囲を超えたときはループして先頭に戻る
    # たとえば配列サイズが 4 のとき
    # 添字 0,1,2,3 は有効な座標なのでそのまま計算する
    # 添字 4 にアクセスしたら 0 を返す
    # 添字 5 にアクセスしたら 1 を返す
    x = x % width

    @rows[y][x]
  end

  def set(x, y, value)
    x = x % width

    @rows[y][x] = value
  end

  def is_tree?(x, y)
    get(x, y) == '#'
  end

  def to_s
    @rows.map(&:join).join("\n")
  end

  def height
    @rows.length
  end

  def width
    @rows.first.length
  end
end

def solve(input_file_name)
  lines = each_lines(input_file_name).map {|line| line }

  count = 0

  Map.new(lines).tap do |map|
    # 開始座標
    x = 0
    y = 0

    # 次の座標を探し続ける
    while(y < map.height - 1) do
      x += 3
      y += 1

      if map.is_tree?(x, y)
        count += 1
      end
    end
  end

  count
end

puts(solve("3.sample.txt"))
puts(solve("3.input.txt"))
