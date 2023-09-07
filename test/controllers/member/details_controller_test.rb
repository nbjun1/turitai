require "test_helper"

class Member::DetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get member_details_show_url
    assert_response :success
  end

  test "should get edit" do
    get member_details_edit_url
    assert_response :success
  end

  test "should get confirm" do
    get member_details_confirm_url
    assert_response :success
  end
end
