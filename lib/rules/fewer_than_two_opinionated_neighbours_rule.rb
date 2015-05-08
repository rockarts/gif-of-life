class FewerThanTwoOpinionatedNeighbours
  def initialize(opinion, neighbours)
    @opinion = opinion
    @neighbours = neighbours
  end
  
  def apply
    if has_opinion?(@opinion)
      opinionated_neighbours = @neighbours.inject(0) do |result, x| 
        if has_opinion?(x)
         result += 1
        else
         result
        end
      end
      
      if(opinionated_neighbours < 2) 
        return :none
      end
    end
    @opinion
  end
  
  private
  def has_opinion?(opinion)
    opinion == :soft || opinion == :hard
  end
  
end