class Order
  attr_reader :items

  def initialize
    @items = Hash.new(0)
  end

  def add(item)
    items[item] += 1
  end

  def show
    items.map {|item, count| "#{item.name} x#{count}" }
  end

end

