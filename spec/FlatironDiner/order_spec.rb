require 'spec_helper'

describe Order do
  let(:bacon) { MenuItem.new "Bacone", "4.99" }
  let(:eggs) { MenuItem.new "Eggs" , "5.99"}
  subject { Order.new.tap { |o| o.add bacon; o.add eggs; o.add eggs;} }

  its(:show) { should match_array ["Bacone x1", "Eggs x2"]}
  its(:total) { should == 16.97 }
  its(:menu_items) { should match_array [bacon, eggs] }

end

