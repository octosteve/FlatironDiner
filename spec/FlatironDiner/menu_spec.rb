require 'spec_helper'

describe Menu do 
  it "can have MenuItems added to it" do 
    menu_item = MenuItem.new 
    menu_item.name = "Awesome Hotdogs"
    menu_item.price = "2.99"

    menu = Menu.new

    menu.add menu_item
    menu.show.should == ["1. Awesome Hotdogs, only $2.99!"]
  end

  it "can have no items in it" do
    menu = Menu.new
    menu.show.should == []
  end

  it "can have multiple items in it" do
    menu_item = MenuItem.new 
    menu_item.name = "Awesome Hotdogs"
    menu_item.price = "2.99"

    menu_item2 = MenuItem.new 
    menu_item2.name = "Chunky Bacon"
    menu_item2.price = "0.99"

    menu = Menu.new

    menu.add menu_item
    menu.add menu_item2

    result = ["1.Awesome Hotdogs, only $2.99!", "2. Chunky Bacon, only $0.99!"]
    menu.show.should == result
  end
end

