#writen by Joshua Cross (11/7/2021)
#last modified by Joshua Cross (11/7/2021)


class BerryBush
  #globalPopulation is a count of how many berry bushes there are in the entire simulation (note: not how many berry bush objects, but the sum of each berry bush objects local population)
  @@globalPopulation = 0
  #foodRate is the rate at which the berry bushes produce food (NOTE: I MAY REWORK THIS TO BE CLASS VARIABLE IN THE NEAR FUTURE SO CONSIDER THIS PORTION OF THE API VOLITILE FOR THE TIME BEING.)
  #reproductionRate is the rate at which the berry bushes reproduce (NOTE: I MAY REWORK THIS TO BE CLASS VARIABLE IN THE NEAR FUTURE SO CONSIDER THIS PORTION OF THE API VOLITILE FOR THE TIME BEING.)
  #localPopulation is the number of berry bushes in the area associated with an instance of the BerryBush class
  def initialize(foodRate, reproductionRate, localPopulation)
    @foodRate = foodRate
    @reproductionRate = reproductionRate
    @localPopulation = localPopulation
    @@globalPopulation = @@globalPopulation + localPopulation
  end
end