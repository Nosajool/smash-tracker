require 'test_helper'

class CharacterTest < ActiveSupport::TestCase
	def setup
		@char = Character.new(name: "Roy")
	end
	test "character should be valid" do
		assert @char.valid?		
	end
end
