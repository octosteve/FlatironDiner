require 'spec_helper'

describe Order do
  it "responds to add" do 
    bacon = MenuItem.new
    subject.add bacon

    subject.items.should include bacon
  end

  it "keeps track of item count" do 
    bacon = MenuItem.new
    bacon.name = "Bacon"

    eggs = MenuItem.new
    eggs.name = "Eggs"

    subject.add bacon
    subject.add eggs
    subject.add eggs

    subject.show.should == ["Bacon x1", "Eggs x2"]
  end

  it "calculates an order's total" do
    bacon = MenuItem.new
    bacon.price = "4.99"

    eggs = MenuItem.new
    eggs.price = "5.99"

    subject.add bacon
    subject.add eggs
    subject.add eggs

    subject.total.should == 16.97
  end
end

