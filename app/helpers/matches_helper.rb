module MatchesHelper
	def stock_hash
		hash = Hash.new
		(1..4).each do |x|
			hash["#{x}"] = x
		end
		hash
	end
end