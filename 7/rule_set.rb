class RuleSet
  def initialize
    @rule_map = {}
  end

  def add(rule)
    @rule_map[rule.container_color] ||= []
    @rule_map[rule.container_color] << rule
  end

  def to_s
    @rule_map.values
  end

  def contain?(container_color, component_color)
    @rule_map[container_color]&.any? do |rule|
      rule.color == component_color || contain?(rule.color, component_color)
    end
  end

  # 与えられた色のカバンがあるとして、
  # そのカバンがもつことのできるカバンの個数を返す（与えられたカバン自身を含む）
  def number_of_components(container_color)
    return 1 if @rule_map[container_color].nil?

    @rule_map[container_color]&.sum do |rule|
      rule.size * number_of_components(rule.color)
    end + 1
  end

  def colors
    @rule_map.keys
  end
end
