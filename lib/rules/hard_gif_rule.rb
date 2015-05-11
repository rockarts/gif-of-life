class HardGifRule
  
  def initialize(opinion, neighbours)
    @opinion = Opinion.new(opinion, neighbours)
    @neighbours = neighbours
  end
  
  def apply
    unless @opinion.has_opinion
      opinion_count = @opinion.opinionated_neighbours

      if(opinion_count == 3)
        opinionated_neighbours = @opinion.find_opinions {|x| x==:hard}
        
        if(opinionated_neighbours == 2) 
          return :hard
        end
      end
    end
    @opinion.opinion
  end
end