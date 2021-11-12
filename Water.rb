#writen by Jack Chiplin (11/11/2021)
#last modified by Jack Chiplin (11/11/2021)

#Given the current population on a tile
#Allocate water to each animal to satisfy their thirst
#Animals who do not have their thirst satisfied will die

#every month look at waterQuanity and subtract waterConsumed from that updates waterQuantity
#every new month waterQuantity = waterCapacity

#To Do:
#Allow progression of months and updateWaterQuantity for each month

class Water
  #waterQuantity is actual amount of water in a tile
  @@waterQuantity = 0
  #waterConsumed is amount of water that animals have drank per month
  @@waterConsumed = 0

  def initialize(waterCapacity, wolfLocalPopulation, bunnyLocalPopulation, animalThirst)
    @waterCapacity = waterCapacity
    #waterCapacity is total amount of water the tile can support
    @wolfLocalPopulation = wolfLocalPopulation
    #wolfLocalPopulation is hardcoded for now
    @bunnyLocalPopulation = bunnyLocalPopulation
    #bunnyLocalPopulation is hardcoded for now
    @animalThirst = animalThirst
    #animalThirst is an integer for how much water each animal needs in a month
  end

  #progressMonth()
  def updateWaterQuantity
    @waterQuantity = @waterCapacity
    #set waterQuantity to waterCapacity at start of every month
    @@waterConsumed = (@wolfLocalPoplation.to_i + @bunnyLocalPopulation.to_i) * @animalThirst
    #water consumed set to how much the total population of animals are thirsty
    @@waterQuantity = @@waterQuantity - @@waterConsumed
    #subtract waterConsumed from waterQuantity to get new waterQuantity
    puts "Water Quantity: #{@@waterQuantity}"
  end

end
