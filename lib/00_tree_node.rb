class PolyTreeNode

  attr_reader :children, :value, :parent

  def initialize(value = nil)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(parent)
    return if self.parent == parent


    if self.parent
      self.parent.children.delete(self)
    end

    @parent = parent

    self.parent.children << self unless self.parent.nil?

    # self

  end

  # def inspect
  #   { "parent" => @parent }.inspect
  # end

  def add_child(child)
    child.parent = self
  end
  
  def remove_child(child)
    if child && !self.children.include?(child)
      raise "Tried to remove node that isn't a child"
    end
    child.parent = nil
  end

  def dfs(target_value)
    return nil if self.nil?
    return self if self.value == target_value

    self.children.each do |child|
      results = child.dfs(target_value)
      return results unless results.nil?
    end
    nil
  end

  def bfs(target_value)
    return nil if self.nil?
    queue = [self]

    until queue.empty?
      removed = queue.shift

      return removed if removed.value == target_value

      removed.children.each { |child| queue << child}
    end

    nil

  end

end