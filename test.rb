require_relative 'Species.rb'
require_relative 'Land.rb'


def joshTestFunction
  puts("TESTSTART")
  dog = Species.new(0,0,0,0.5,3)
  homeBase = Land.new([dog],0)

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
end
joshTestFunction