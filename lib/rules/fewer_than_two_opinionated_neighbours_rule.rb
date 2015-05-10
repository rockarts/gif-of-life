class FewerThanTwoOpinionatedNeighbours

  def initialize(opinion, neighbours)
    @opinion = Opinion.new(opinion, neighbours)
  end
  
  def apply
    if @opinion.has_opinion
      opinionated_neighbours = @opinion.opinionated_neighbours
      
      if(opinionated_neighbours < 2) 
        return :none
      end
    end
    
    return @opinion.opinion
  end

end