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

  def colors
    @rule_map.keys
  end
end
