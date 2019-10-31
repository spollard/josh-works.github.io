class Duck
  
  def quack
    p "quack"
  end
  
  def swim
    p "swim"
  end
  
  def display
  end
end

class MallardDuck < Duck
  def display
    p 'looks like mallard'
  end
end

class RedheadDuck < Duck
  def display
    p 'looks like redhead'
  end
end