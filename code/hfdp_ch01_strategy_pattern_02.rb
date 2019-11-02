om .
module Flyable
  def fly
    'im flying'
  end
end

class Duck
  def quack
    "quack"
  end
  
  def swim
    "swim"
  end
  
  def display
  end
end

class MallardDuck < Duck
  include Flyable
  def display
    'looks like mallard'
  end
end

class RedheadDuck < Duck
  include Flyable
  def display
    'looks like redhead'
  end
end

class RubberDuck < Duck
  def quack
    'squeek'
  end
end

class DecoyDuck < Duck
  def quack
    'nothin'
  end
  
  def display
    'decoy duck'
  end

end


m = MallardDuck.new
r = RedheadDuck.new
d = Duck.new
rub = RubberDuck.new
require "pry"; binding.pry