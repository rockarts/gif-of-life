class Verdict 
  
  def initialize(seating_arrangement)
    @seating_arrangement = seating_arrangement
  end
  
  def tabulate
    opinion_counts = Hash.new(0)

    @seating_arrangement.flatten.each do |opinion|
      opinion_counts[opinion] += 1
    end
    
    max_opinion = opinion_counts.values.max
    prevailing_opinion = opinion_counts.select { |k, v| v == max_opinion }.keys
    
    if prevailing_opinion.count > 1
      return :push
    else
      return prevailing_opinion[0]
    end
  end
end