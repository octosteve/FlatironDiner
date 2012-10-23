require 'spec_helper'

describe Order do
  let(:bacon) do 
    b = MenuItem.new
    b.name = "Bacone"
    b.price = "4.99"
    b
  end

  let(:eggs) do
    e = MenuItem.new
    e.name = "Eggs"
    e.price = "5.99"
    e
  end

  subject do 
    order = Order.new
    order.add bacon
    order.add eggs
    order.add eggs
    order
  end

  its(:show) { should match_array ["Bacone x1", "Eggs x2"]}
  its(:total) { should == 16.97 }

end

