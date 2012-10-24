require 'spec_helper'

describe Recommender do 
  it "returns a list of items with similar ingredients" do
    menu = Menu.new

    bacon = MenuItem.new
    bacon.name = "Chunky Bacon"
    bacon.ingredients = [:bacon]

    bacone = MenuItem.new
    bacone.name = "Bacone"
    bacone.ingredients =  [:bacon, :scrambled_eggs, :cheese, :hash_browns, :gravy, :biscuit] 

    veggie_burger = MenuItem.new
    veggie_burger.name = "Brocolli"
    veggie_burger.ingredients = [:veggies, :unspeakable]
    
    [bacon, bacone, veggie_burger].each {|item| menu.add item}
    order = Order.new

    order.add bacon

    recommender = Recommender.new menu: menu, order: order

    recommender.recomendations.should match_array [bacone]
    recommender.recomendations.should_not include veggie_burger
  end
end

