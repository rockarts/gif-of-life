class SoftGifRule
  
  def initialize(opinion, neighbours)
    @opinion = opinion
    @neighbours = neighbours
  end
  
  def apply
    unless has_opinion?(@opinion) 
      opinion_count = @neighbours.inject(0) { |result, x| has_opinion?(x) ? result += 1 : result }

      if(opinion_count == 3)
        opinionated_neighbours = @neighbours.inject(0) { |result, x| x == :soft ? result += 1 : result }
        
        if(opinionated_neighbours == 2) 
          return :soft
        end
      end
    end
    @opinion
  end
  
  private
  def has_opinion?(opinion)
    opinion == :soft || opinion == :hard
  end
  
end