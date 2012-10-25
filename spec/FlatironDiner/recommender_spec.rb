require 'spec_helper'

describe Recommender do 
  let(:menu) { Menu.new }
  let(:order) { Order.new }

  let(:bacon) do 
    MenuItem.new.tap do |mi|
      mi.name = "Chunky Bacon"
      mi.ingredients = [:bacon]
    end
  end

  let(:veggie_burger) do
    MenuItem.new.tap do |mi|
      mi.name = "Brocolli"
      mi.ingredients = [:veggies, :unspeakable]
    end
  end

  it "returns an empty array if there are no matches" do
    [bacon, veggie_burger].each {|item| menu.add item}

    order.add bacon

    recommender = Recommender.new menu: menu, order: order
    recommender.recomendations.should be_empty
  end

  it "returns a list of items with similar ingredients" do
    bacone = MenuItem.new.tap do |mi|
      mi.name = "Bacone"
      mi.ingredients =  [:bacon, :scrambled_eggs, :cheese, :hash_browns, :gravy, :biscuit] 
    end

    [bacon, bacone, veggie_burger].each {|item| menu.add item}

    order.add bacon

    recommender = Recommender.new menu: menu, order: order

    recommender.recomendations.should match_array [bacone]
    recommender.recomendations.should_not include veggie_burger
  end
end

