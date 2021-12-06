#writen by Joshua Cross (10/17/2021)
#last modified by Joshua Cross (11/26/2021)


class Species
  #globalPopulation is an array that contains the total population of each species across all Land objects
  @@globalPopulation = []
  #speciesID is the index used by the species in @@globalPopulation
  #consumptionLevel is how high on the food chain a species is
  #consumptionAmount is how much food a species needs
  #reproductionRate multiplied by the current population and then added to the current population equals the new population
  #localPopulation is how many of a given species exist in this the land area associated with this Species object
  def initialize(speciesID, consumptionLevel, consumptionAmount, reproductionRate, localPopulation)
    @speciesID = speciesID
    @consumptionLevel = consumptionLevel
    @consumptionAmount = consumptionAmount
    @reproductionRate = reproductionRate
    @localPopulation = localPopulation
    while(@@globalPopulation.size <= speciesID)
      @@globalPopulation.push(0)
    end
    @@globalPopulation[speciesID] = @@globalPopulation[speciesID] + localPopulation

  end

  def getSpeciesID
    return(@speciesID)
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

  def getLocalPopulation
    return(@localPopulation)
  end

  def setLocalPopulation(newPop)
    @@globalPopulation[@speciesID] += (newPop - @localPopulation)
    @localPopulation = newPop
  end

  def getGlobalPopulation
    return(@@globalPopulation[@speciesID])
  end

  #this is a very rough prototype that will be updated!
  def reproduction
    if(@localPopulation > 1)
      @@globalPopulation[@speciesID] = @@globalPopulation[@speciesID] + (@localPopulation * @reproductionRate).floor
      @localPopulation = @localPopulation + (@localPopulation * @reproductionRate).floor
    end
  end

  def to_s
    return("Species (" + @speciesID.to_s + "); Local Population: " + @localPopulation.to_s + " GlobalPopulation: " + @@globalPopulation[@speciesID].to_s)
  end

end

class BunnySpecies < Species
  def to_s
    return("Bunny (" + @speciesID.to_s + "); Local Population: " + @localPopulation.to_s + " GlobalPopulation: " + @@globalPopulation[@speciesID].to_s + "|")
  end
end

class WolfSpecies < Species
  def to_s
    return("Wolf (" + @speciesID.to_s + "); Local Population: " + @localPopulation.to_s + " GlobalPopulation: " + @@globalPopulation[@speciesID].to_s + "|")
  end
end