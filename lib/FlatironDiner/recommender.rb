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
    @similar = @order.menu_items.collect do |order_mi|
      @menu.menu_items.collect do |menu_mi|
        next if menu_mi == order_mi
        menu_mi unless (order_mi.ingredients & menu_mi.ingredients).empty?
      end
    end.flatten.compact
  end
end
