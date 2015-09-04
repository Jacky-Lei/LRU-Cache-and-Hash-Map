class Link
  attr_accessor :key, :val, :next

  def initialize(key = nil, val = nil, nxt = nil)
    @key, @val, @next = key, val, nxt
  end

  def to_s
    "#{@key}, #{@val}"
  end
end

class LinkedList
  attr_reader :head

  def initialize
    @head = Link.new
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head
  end

  def last
    current = @head
    until current.next.nil?
      current = current.next
    end
    current
  end

  def empty?
    @head.nil?
  end

  def get(key)
    current = @head
    until current.key == key || current.next.nil?
      current = current.next
    end
    return current.val if current.key == key
    nil
  end

  def include?(key)
  end

  def insert(key, val)
    last.next = Link.new(key, val)
  end

  def remove(key)
    if head.key == key
      @head = @head.next
    else
      current = head
      until current.next.key == key || current.next.nil?
        current = current.next
      end
      if current.next.key == key
        current.next = current.next.next #next after nil would raise error
      end
    end
  end

  def each
    self.length.times do |i|
      prc.call(self[i])
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
