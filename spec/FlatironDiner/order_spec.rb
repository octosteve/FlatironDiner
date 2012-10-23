require 'spec_helper'

describe Order do
  let(:bacon) do 
    MenuItem.new "Bacone", "4.99"
  end

  let(:eggs) do
    MenuItem.new "Eggs" , "5.99"
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

