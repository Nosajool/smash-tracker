require 'test_helper'

class MatchTest < ActiveSupport::TestCase
	def setup
    @match = matches(:evo)
	end

	test "match should be valid" do
		assert @match.valid?
	end

	test "winner id should exist" do
		@match.winner = nil
		assert_not @match.valid?
	end

	test "loser id should exist" do
		@match.loser = nil
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

	test "default order" do
    apex = matches(:apex)
    today = Time.now
    yesterday = today - 1.day
    Timecop.freeze(today) do
      @match.update!(created_at: today)
      apex.update!(created_at: yesterday)

      assert_equal Match.first, @match
      assert_equal Match.last, apex
    end
	end
end
