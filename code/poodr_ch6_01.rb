class Bicyle
  attr_reader :style, :size, :tape_color, :front_shock, :rear_shock
  def initialize(args)
    @style = args[:style]
    @size = args[:size]
    @tape_color = args[:tape_color]
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
  end
  
  def spares
    { 
      chain: '10-speed',
      tire_size: '23',
      tape_color: tape_color
    }
  end
end

class MountainBike < Bicyle
  attr_reader :front_shock, :rear_shock
  def initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
    super(args)
  end
  
  def spares
    super.merge(rear_shock: rear_shock)
  end
end

mtb = MountainBike.new(
  style: :mountain,
  size: 'S',
  front_shock: 'Manitou',
  rear_shock: 'Fox'
  )
require "pry"; binding.pry
p mtb