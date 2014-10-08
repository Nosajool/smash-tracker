require 'test_helper'

class MatchTest < ActiveSupport::TestCase
	def setup
		@user1 = users(:user1)
		@user2 = users(:user2)
		@match = Match.new(winner_stock: 1, winner_id: @user1.id, loser_id: @user2.id)
	end

	test "match should be valid" do
		assert @match.valid?		
	end

	test "winner id should exist" do
		@match.winner_id = nil
		assert_not @match.valid?
	end

	test "loser id should exist" do
		@match.loser_id = nil
		assert_not @match.valid?
	end

	test "winner stock should be greater than 0" do
		@match.winner_stock = -1
		assert_not @match.valid?
	end

	test "winner stock shoud be less than or equal to 4" do
		@match.winner_stock = 5
		assert_not @match.valid?
	end

	test "winner stock should be present" do
		@match.winner_stock = nil
		assert_not @match.valid?
	end

	test "order should be most recent first" do
		assert_equal Match.first, matches(:three)
	end
end
