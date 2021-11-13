#writen by Joshua Cross (11/7/2021)
#last modified by Joshua Cross (11/13/2021)


class BerryBush
  #DEFAULTFOODRATE is the default value for foodRate
  #DEFAULTREPRODUCTIONRATE is the default value for reproductionRate
  #DEFAULTPOPCAP is effectively the default value for @popCap
  #MOUNTAINPOPCAP is the value for @popcap if mountain is true
  DEFAULTFOODRATE = 2
  DEFAULTREPRODUCTIONRATE = 2
  DEFAULTPOPCAP = 1000
  MOUNTAINPOPCAP = 500
  #@@globalPopulation is a count of how many berry bushes there are in the entire simulation (note: not how many berry bush objects, but the sum of each berry bush object's local population)
  @@globalPopulation = 0
  #@foodRate is the rate at which the berry bushes produce food 
  #@reproductionRate is the rate at which the berry bushes reproduce 
  #@localPopulation is the number of berry bushes in the area associated with an instance of the BerryBush class
  #mountain should be true if and only if the tile that this BerryBush object exists in is mountainous
  def initialize(localPopulation, foodRate = DEFAULTFOODRATE, reproductionRate = DEFAULTREPRODUCTIONRATE, mountain = false)
    @foodRate = foodRate
    @reproductionRate = reproductionRate
    puts("mountain is " + mountain.to_s)
    if(mountain)
      @popCap = MOUNTAINPOPCAP
    else
      @popCap = DEFAULTPOPCAP
    end
    
    if(@popCap > localPopulation)
      @localPopulation = localPopulation
      puts("@popCap > localPopulation")
    else
      @localPopulation = @popCap
      puts("@popCap <= localPopulation")
    end
    #puts("LOCAL POPULATION IS " + @localPopulation.to_s)
    @@globalPopulation = @@globalPopulation + @localPopulation
  end

  #this is a very rough prototype that will be updated!
  def reproduction
    if(@localPopulation > 1)
      @@globalPopulation = @@globalPopulation + (@localPopulation * @reproductionRate).floor
      oldPop = @localPopulation
      @localPopulation = @localPopulation + (@localPopulation * @reproductionRate).floor
      if(@localPopulation > @popCap)
        enforcer = @localPopulation - @popCap
        @localPopulation = @localPopulation - enforcer
        @@glocalPopulation = @@globalPopulation - enforcer
      end
    end
  end

  def getLocalPopulation
    return(@localPopulation)
  end

  def getGlobalPopulation
    return(@@globalPopulation)
  end

  def getFoodRate
    return(@foodRate)
  end

  def getPopCap
    return(@popCap)
  end

end