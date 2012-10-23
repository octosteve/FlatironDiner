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

end

