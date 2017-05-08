require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

	test "layout links" do
		get root_path
		    assert_select "a[href=?]", root_path
		    assert_select "a[href=?]", new_match_path
		    assert_select "a[href=?]", matches_path
		    assert_select "a[href=?]", users_path
	end
end
