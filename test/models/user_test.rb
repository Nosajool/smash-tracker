require 'test_helper'

class UserTest < ActiveSupport::TestCase

	def setup
		@user = User.new(name: "Test")
	end

	test "should be valid" do
		assert @user.valid?
	end

	test "name should be present" do
		@user.name = ""
		assert_not @user.valid?
	end

	test "names should be unique" do
		duplicate_user = @user.dup
		@user.save
		assert_not duplicate_user.valid?
	end

	test "names should not contain white spaces" do
		@user.name = "name with spaces"
		assert_not @user.valid?
	end
end
