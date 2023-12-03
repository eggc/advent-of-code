require 'strscan'

# 問題の一行を扱うクラス
class Line
  def self.parse(line)
    Line.new(line).parse
  end

  def initialize(line)
    @line = line.strip
    @rules = []
  end

  def parse
    s = StringScanner.new(@line)
    s.scan_until(/ bags contain /)
    s.pre_match.tap { |x| @color = x }
    s.string = s.rest

    unless s.scan(/no other bags./)
      @rules << parse_component_rule(s) while s.rest?
    end

    @rules
  end

  private

  def parse_component_rule(s)
    Rule.new.tap do |rule|
      rule.container_color = @color

      s.scan(/[ 0-9]+/)
      s.matched.tap { |x| rule.size = x.to_i }
      s.string = s.rest

      s.scan_until(/ bags?[.,]/)
      s.pre_match.tap { |x| rule.color = x.strip }
      s.string = s.rest
    end
  end
end
