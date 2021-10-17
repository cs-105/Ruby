#writen by Joshua Cross (10/17/2021)
#last modified by Joshua Cross (10/17/2021)

#TODO: figure out how reproductionRate will be formatted and then how to fit that into the reproduction method.


class Species
  def initialize(consumptionLevel, consumptionAmount, reproductionRate, population)
    @consumptionLevel = consumptionLevel
    @consumptionAmount = consumptionAmount
    @reproductionRate = reproductionRate
    @population = population
  end

  def getConsumptionLevel
    return(@consumptionLevel)
  end

  def getConsumptionAmount
    return(@consumptionAmount)
  end

  def getReproductionRate
    return(@reproductionRate)
  end

  def getPopulation
    return(@population)
  end

  #this is a very rough prototype that will be updated!
  def reproduction
    if(@population > 1)
      @population = @population + (@population / @reproductionRate)
    end
  end

end