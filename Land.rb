#writen by Joshua Cross (10/17/2021)
#last modified by Joshua Cross (11/12/2021)


require_relative 'BerryBush.rb'

class Land
  #@@mountainThreshold is the minumum elevation for a tile to be considered a mountain tile
  @@mountainThreshold = 10
  #create a Land object. These objects will be the subunits of the map
  #takes species and elevation as arguements. species should be an array containing species objects (or at least members of children classes of species) while elevation should be (some sort of number, probably an int but that decision still needs to be made)
  #@species is an array containing decending from the species class
  #@elevation is a number (type still tbd) that reflects the elevation of the tile.
  #@mountainous is true if elevation is greater than or equal to the mountainThreshold, false otherwise
  #@berryBushes is a BerryBush object that represents all of the berry bushes in this tile 
  def initialize(species, elevation, berryBushes = 0)
    #puts("berryBushes: " + berryBushes.to_s)
    @species = species
    @elevation = elevation
    
    
    if(@elevation >= @@mountainThreshold)
      #puts("It's kind of a mountain")
      @mountainous = true
      @berryBushes = BerryBush.new(berryBushes, 0, 0, true)
    else
      @mountainous = false
      #puts("It's not really a mountain")
      @berryBushes = BerryBush.new(berryBushes)
    end
    
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

  def getBerryBushes
    return(@berryBushes)
  end

  def isMountainous
    return(@mountainous)
  end

  def to_s
    speciesStrings = ""
    for difSpec in @species
      speciesStrings = speciesStrings + difSpec.to_s
    end
    return("Land; " + "Species: " + speciesStrings + " Elevation: " + @elevation.to_s + "\n\n")
  end

end