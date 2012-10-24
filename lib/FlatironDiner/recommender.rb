class Recommender
  def initialize(options)
    @order = options.fetch(:order, Order.new)
    @menu = options.fetch(:menu, Menu.new)
  end

  def recomendations
    [@menu.fetch(2)]
  end
end
