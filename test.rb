#Josh's test file, (SHOULD NOT IN ANY WAY BE CALLED IN THE FINAL PRODUCT! THE ONLY REASON THAT THIS FILE SHOULD EVER BE USED IS FOR TESTING PURPOSES!)
require_relative 'Species.rb'
require_relative 'Land.rb'


def joshTestFunction
  puts("TESTSTART")
  dog = Species.new(0,0,0,0.5,3)
  homeBase = Land.new([dog],0,2)

  puts("consumptionAmount:")
  puts(dog.getConsumptionAmount)
  puts("consumptionLevel:")
  puts(dog.getConsumptionLevel)
  puts("reproductionRate:")
  puts(dog.getReproductionRate)

  puts("\ntesting Land now \n\n")

  puts("consumptionAmount:")
  puts(homeBase.getSpecies[0].getConsumptionAmount)
  puts("consumptionLevel:")
  puts(homeBase.getSpecies[0].getConsumptionLevel)
  puts("reproductionRate:")
  puts(homeBase.getSpecies[0].getReproductionRate)

  puts("\n testing population growth now \n\n")

  i = 0
  while(dog.getLocalPopulation > 1 && dog.getLocalPopulation < 10 && i < 30)
    puts("local population:")
    puts(dog.getLocalPopulation)
    puts("global population:")
    puts(dog.getGlobalPopulation)
    puts("")
    dog.reproduction
    i = i + 1
  end
  puts("final local population:")
  puts(dog.getLocalPopulation)
  puts("final global population:")
  puts(dog.getGlobalPopulation)

  #puts(homeBase.getSpecies[0].getLocalPopulation)
  puts("rabbits test begin")
  puts(homeBase.getSpecies)
  puts(dog.to_s)
  rabbits = BunnySpecies.new(1, 0, 0, 1, 5)
  puts(rabbits.getGlobalPopulation)
  homeBase.addSpecies(rabbits)
  puts(homeBase.getSpecies)
  puts("rabbits test end")

  puts("elevation test begin")
  puts(homeBase.getElevation)
  puts("elevation test end")

  puts("multiple global population test begin")
  puts(rabbits.getGlobalPopulation)
  puts(dog.getGlobalPopulation)
  dog.reproduction
  puts(rabbits.getGlobalPopulation)
  puts(dog.getGlobalPopulation)
  rabbits.reproduction
  puts(rabbits.getGlobalPopulation)
  puts(dog.getGlobalPopulation)
  puts("multiple global population test end")

  puts("mountain testing start")
  puts("homeBase:")
  puts(homeBase.getElevation)
  puts(homeBase.isMountainous)
  puts("hillBase:")
  hillBase = Land.new([], 9, 2)
  puts(hillBase.getElevation)
  puts(hillBase.isMountainous)
  puts("lowMountainBase:")
  lowMountainBase = Land.new([], 10, 2)
  puts(lowMountainBase.getElevation)
  puts(lowMountainBase.isMountainous)
  puts("mountainBase:")
  mountainBase = Land.new([], 11, 2)
  puts(mountainBase.getElevation)
  puts(mountainBase.isMountainous)
  puts("summitBase:")
  summitBase = Land.new([], 36)
  puts(summitBase.getElevation)
  puts(summitBase.isMountainous)
  puts("mountain testing end")
  puts("\n\n\n")
  puts("plant test begin")
  puts("berryBaseLowLow(10)")
  berryBaseLowLow = Land.new([], 5, 10)
  puts(berryBaseLowLow.getBerryBushes.getLocalPopulation)
  puts("berryBaseLowHigh(1000)")
  berryBaseLowHigh = Land.new([], 5, 10000)
  puts(berryBaseLowHigh.getBerryBushes.getLocalPopulation)
  puts("berryBaseHighLow(10)")
  berryBaseHighLow = Land.new([], 15, 10)
  puts(berryBaseHighLow.getBerryBushes.getLocalPopulation)
  puts("berryBaseHighHigh(500)")
  berryBaseHighHigh = Land.new([], 15, 10000)
  puts(berryBaseHighHigh.getBerryBushes.getLocalPopulation)
  puts("berryBaseHighMid(500)")
  berryBaseHighMid = Land.new([], 15, 600)
  puts(berryBaseHighMid.getBerryBushes.getLocalPopulation)
  puts("plants test end")
end