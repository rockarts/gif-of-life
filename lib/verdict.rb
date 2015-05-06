class Verdict 
  
  def initialize(seating_arrangement)
    @seating_arrangement = seating_arrangement
  end
  
  def tabulate
    opinion_counts = Hash.new 0

    @seating_arrangement.flatten.each do |opinion|
      opinion_counts[opinion] += 1
    end
    return opinion_counts.max_by{|k,v| v}[0]
  end
end