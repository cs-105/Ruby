#writen by Joshua Cross (10/17/2021)
#last modified by Joshua Cross (11/6/2021)

class Land
  #create a Land object. These objects will be the subunits of the map
  #takes species and elevation as arguements. species should be an array containing species objects (or at least members of children classes of species) while elevation should be (some sort of number, probably an int but that decision still needs to be made)
  #species is an array containing decending from the species class
  #elevation is a number (type still tbd) that reflects the elevation of the tile.
  def initialize(species, elevation)
    @species = species
    @elevation = elevation
  end

  def getSpecies
    return(@species)
  end

  def addSpecies(newSpecies)
    @species.push(newSpecies)
  end

  def getElevation
    return(@elevation)
  end

  def to_s
    return("Land; " + " Elevation: " + @elevation.to_s)
  end

end