require 'spec_helper'

describe Order do
  it "responds to add" do 
    bacon = MenuItem.new
    order = Order.new
    order.add bacon

    order.items.should include bacon
  end
end

