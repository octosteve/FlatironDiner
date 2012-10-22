require 'spec_helper'

describe MenuItem do 

  it "can have its name set" do 
    subject.name = "Chunky Bacon"
    subject.name.should == "Chunky Bacon"
  end

  it "can have its price set" do
    subject.price = "2.99"
    subject.price.should == "2.99"
  end

  it "can have its calorie count set" do 
    subject.calorie_count = 256
    subject.calorie_count.should == 256
  end

  it "can have its ingredients set" do 
    subject.ingredients = [:bacon, :thats_it]
    subject.ingredients.should == [:bacon, :thats_it]
  end
end
