require 'spec_helper'

describe Menu do 

  context "with no items" do 
    its(:show) { should be_empty }
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

    it "can have MenuItems added to it" do 
      subject.show.should == ["1. Awesome Hotdogs, only $2.99!"]
    end


    it "can have multiple items in it" do
      menu_item2 = MenuItem.new 
      menu_item2.name = "Chunky Bacon"
      menu_item2.price = "0.99"

      subject.add menu_item2

      result = ["1. Awesome Hotdogs, only $2.99!", "2. Chunky Bacon, only $0.99!"]

      subject.show.should == result
    end

    it "returns an item based on item number" do 
      subject.fetch(1).name.should == "Awesome Hotdogs"
    end
  end
end

