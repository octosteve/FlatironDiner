require 'spec_helper'

describe MenuItem do 

  it "responds to #name" do 
    menu_item = MenuItem.new
    menu_item.should respond_to(:name)
  end
end
