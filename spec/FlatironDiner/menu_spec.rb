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
      MenuItem.new.tap do |mi|
        mi.name = "Awesome Hotdogs"
        mi.price = "2.99"
      end
    end

    subject { Menu.new.tap {|m| m.add menu_item } }

    its(:show) { should == ["1. Awesome Hotdogs, only $2.99!"]}
    its(:menu_items) { should == [menu_item]}

    it "returns an item based on item number" do 
      subject.fetch(1).name.should == "Awesome Hotdogs"
    end

    it "can have multiple items in it" do
      menu_item2 = MenuItem.new.tap do |mi| 
        mi.name = "Chunky Bacon"
        mi.price = "0.99"
      end

      subject.add menu_item2

      result = ["1. Awesome Hotdogs, only $2.99!", "2. Chunky Bacon, only $0.99!"]

      subject.show.should == result
    end

  end
end

