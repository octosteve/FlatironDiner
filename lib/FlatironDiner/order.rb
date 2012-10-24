class Order
  attr_reader :items

  def initialize
    @items = Hash.new(0)
  end

  def add(item)
    items[item] += 1
  end

  def show
    items.map {|item| format_output item }
  end

  def total
    items.inject(0){|memo, item| memo += total_per_item(item)}
  end

  def menu_items
    items.keys
  end
  private

  def total_per_item(item_array)
    item, quantity = item_array
    item.price.to_f * quantity
  end

  def format_output(item_array)
    item, count = item_array 
    "#{item.name} x#{count}" 
  end
end

