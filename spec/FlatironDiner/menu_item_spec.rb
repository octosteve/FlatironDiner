require 'spec_helper'

describe MenuItem do 

  subject do 
    mi = MenuItem.new
    mi.name = "Chunky Bacon"
    mi.price = "2.99"
    mi.calorie_count = 256
    mi.ingredients = [:bacon, :thats_it]
    mi
  end

  its(:name)          { should == "Chunky Bacon"      }
  its(:price)         { should == "2.99"              }
  its(:calorie_count) { should ==  256                }
  its(:ingredients)   { should == [:bacon, :thats_it] }

end
