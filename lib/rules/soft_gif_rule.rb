class SoftGifRule
  
  def initialize(opinion, neighbours)
    @opinion = Opinion.new(opinion, neighbours)
    @neighbours = neighbours
  end
  
  def apply
    unless @opinion.has_opinion
      opinion_count = @opinion.opinionated_neighbours

      if(opinion_count == 3)
        opinionated_neighbours = @neighbours.inject(0) { |result, x| x == :soft ? result += 1 : result }
        
        if(opinionated_neighbours == 2) 
          return :soft
        end
      end
    end
    @opinion.opinion
  end
  
end