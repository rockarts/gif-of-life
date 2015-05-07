class SoftGifRule
  
  def initialize(neighbours)
    @neighbours = neighbours
  end
  
  def apply
    opinionated_neighbours = @neighbours.inject(0) do |result, x| 
      if(x == :soft)
       result += 1
      else
       result
      end
    end
    
    if(opinionated_neighbours == 2) 
      return :soft
    end
  end
  
end