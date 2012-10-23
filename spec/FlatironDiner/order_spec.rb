require 'spec_helper'

describe Order do
  it "responds to add" do 
    bacon = MenuItem.new
    order = Order.new
    order.add bacon

    order.items.should include bacon
  end

  it "keeps track of item count" do 
    bacon = MenuItem.new
    bacon.name = "Bacon"

    eggs = MenuItem.new
    eggs.name = "Eggs"

    order = Order.new

    order.add bacon
    order.add eggs
    order.add eggs

    order.show.should == ["Bacon x1", "Eggs x2"]
  end

  it "calculates an order's total" do
    bacon = MenuItem.new
    bacon.price = "4.99"

    eggs = MenuItem.new
    eggs.price = "5.99"

    order = Order.new

    order.add bacon
    order.add eggs
    order.add eggs

    order.total.should == 16.97
  end
end

