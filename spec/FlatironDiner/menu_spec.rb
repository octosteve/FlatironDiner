require 'spec_helper'

describe Menu do 

  context "with no items" do 
    its(:show) { should be_empty }

    it "returns nil if invalid fetch value given" do 
      subject.fetch(1).should be_nil
      subject.fetch(-1).should be_nil
      subject.fetch(100).should be_nil
      subject.fetch("yogurt").should be_nil
    end
  end

  context "with items in it" do
    let(:menu_item) do 
      menu_item = MenuItem.new 
      menu_item.name = "Awesome Hotdogs"
      menu_item.price = "2.99"
      menu_item
    end

    subject do 
      menu = Menu.new
      menu.add  menu_item
      menu
    end

    its(:show) { should == ["1. Awesome Hotdogs, only $2.99!"]}

    it "returns an item based on item number" do 
      subject.fetch(1).name.should == "Awesome Hotdogs"
    end

    it "can have multiple items in it" do
      menu_item2 = MenuItem.new 
      menu_item2.name = "Chunky Bacon"
      menu_item2.price = "0.99"

      subject.add menu_item2

      result = ["1. Awesome Hotdogs, only $2.99!", "2. Chunky Bacon, only $0.99!"]

      subject.show.should == result
    end

  end
end

