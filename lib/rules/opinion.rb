class Opinion
	attr_accessor :opinion
	def initialize(opinion, neighbours)
		@opinion = opinion
		@neighbours = neighbours
	end

	def opinionated_neighbours()
		@neighbours.inject(0) { |result, x| has_opinion?(x) ? result += 1 : result }
	end

	def has_opinion
		self.has_opinion?(@opinion)
	end

	def has_opinion?(opinion)
		opinion == :soft || opinion == :hard
	end
	
	def find_opinions(&block)
    @neighbours.inject(0) { |result, x|  block.call(x) ? result += 1 : result }
  end
end