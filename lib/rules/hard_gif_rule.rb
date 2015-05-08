class HardGifRule
  
  def initialize(opinion, neighbours)
    @opinion = opinion
    @neighbours = neighbours
  end
  
  def apply
    unless has_opinion?
      opinionated_neighbours = @neighbours.inject(0) do |result, x| 
        if(x == :hard)
         result += 1
        else
         result
        end
      end
      
      if(opinionated_neighbours == 2) 
        return :hard
      end
    end
    @opinion
  end
  
  private
  def has_opinion?
    @opinion == :soft || @opinion == :hard
  end
  
end