#writen by Joshua Cross (10/17/2021)
#last modified by Joshua Cross (10/17/2021)

class Land
  def initialize(species)
    @species = species
  end

  def getSpecies
    return(@species)
  end

  def addSpecies(newSpecies)
    @species.push(newSpecies)
  end

end
