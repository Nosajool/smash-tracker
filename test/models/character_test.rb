require 'test_helper'

class CharacterTest < ActiveSupport::TestCase
	def setup
    @char = characters(:fox)
	end
	test "character should be valid" do
		assert @char.valid?		
	end
end
