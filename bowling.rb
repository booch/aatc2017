class Game
	MAX_FRAMES=10
  @pins=0
  @totRolls=Array.new
  @score=0

  def initialize
  	@pins=0
    @totRolls=Array.new(10,0)
    @score=0
  end

  def roll(pins)
  	@totRolls << pins
  	#return pins
  end

  def score
    raise BowlingError, ("Pins are not in range of 0 to 10") if (@totRolls.any? { |e| e<0 || e>10 } )
    # raise BowlingError, ("Game is not strated") if (@totRolls.size < 10)
    calculate_score(@totRolls)
  end

  def spare_check?(index)
  	@totRolls[index]+@totRolls[index+1]==10
  end

  def strike_check?(index)
  	@totRolls[index]==10
  end

  def spare_twice_check?(index)
	  if spare_check?(index)
      return (@totRolls[index+2]+@totRolls[index+3]==10)
	  end
  end

  def last_frame?(index)
    return @totRolls[index]!=0
  end

  def all_strikes(totRolls)
  	score=0
  	for i in 0..totRolls.size-3
      j=i
      count=0
      while (j<=totRolls.size-1)
        if(totRolls[j]==10)
          score=score+totRolls[j]
          count+=1
        end
        if(count<3)
          j+=1
        else
          break
        end
      end
    end
    return score
  end

  def same_values?(totRolls)
    totRolls.uniq == [10]
  end

  def calculate_score(totRolls)
    throws=0
    while(throws<@totRolls.size-1)
    	if same_values?(totRolls)#(all_strikes(totRolls)==300)
    	  @score=all_strikes(totRolls)
      elsif (last_frame?(totRolls.size-3) && totRolls[0]==0)
      	throws=@totRolls.size-1
        @score=@score+(totRolls[throws]+totRolls[throws-1]+totRolls[throws-2])
      elsif strike_check?(throws)
      	@score=@score+(10+ (2*totRolls[throws+1])+(2*totRolls[throws+2]))
      	throws=throws+2
      elsif spare_twice_check?(throws)
        @score=@score+(20+totRolls[throws+2]+2*totRolls[throws+4])
        throws =throws+5
      elsif spare_check?(throws)
        @score=@score+(10+2*totRolls[throws+2])
        throws=throws+3
      elsif(!strike_check?(throws) || !spare_check?(throws))
      	@score=@score+totRolls[throws]
      	throws=throws+1
      end
    end

      return @score
  end


  class BowlingError < StandardError
  end

end
