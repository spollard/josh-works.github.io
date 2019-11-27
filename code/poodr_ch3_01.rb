# Ch 3 - managing dependencies
# dependency injection

class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(args)
    @chainring        = args[:chainring]
    @cog              = args[:cog]
    @wheel            = Wheel.new(args[:rim], args[:tire])
  end
  
  def ratio
    chainring / cog.to_f
  end
  
  def gear_inches
    # Gear needs to know name of Wheel class
    # Gear needs to know #diameter method of Wheel class
    # Gear needs to know what Wheel requires `rim` and `tire` attributes
    # gear needs to know order of those rim & tire arguments
    ratio * diameter
    # ratio * Wheel.new(rim, tire).diameter
  end
  
  def diameter
    wheel.diameter
  end
end

class Wheel
  attr_reader :rim, :tire
  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end
  
  def diameter
    rim + (tire * 2)
  end
  
  def circumference
    diameter * Math::PI
  end
end

puts Gear.new(chainring: 52, cog: 11, rim: 26, tire: 1.5).gear_inches
puts Gear.new(chainring: 30, cog: 27, rim: 24, tire: 1.25).gear_inches
# wheel = Wheel.new(24, 1.25)
# puts Gear.new(30, 27, wheel).gear_inches