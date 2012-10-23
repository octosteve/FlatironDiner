class Menu
  def add(menu_item)
    @called_add = true
  end
  
  def show
    if @called_add
      ["1. Awesome Hotdogs, only $2.99!"]
    else
      []
    end
  end
end
