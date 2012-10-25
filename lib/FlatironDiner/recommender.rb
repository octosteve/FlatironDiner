class Recommender
  def initialize(options)
    @order = options.fetch(:order, Order.new)
    @menu = options.fetch(:menu, Menu.new)
  end

  def recomendations
    find_similar_items
  end

  private

  def find_similar_items
    @order.menu_items.each_with_object([]) do |order_mi, similar|
      @menu.menu_items.find_all do |menu_mi|
        similar << menu_mi if not_in_order?(order_mi, menu_mi) && ingredients_shared?(order_mi, menu_mi)
      end
    end
  end
  
  def not_in_order?(order_mi, menu_mi)
    !(menu_mi == order_mi)
  end

  def ingredients_shared?(order_mi, menu_mi)
    !(order_mi.ingredients & menu_mi.ingredients).empty?
  end
end
