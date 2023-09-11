require "test_helper"

class Member::ResultsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get member_results_index_url
    assert_response :success
  end

  test "should get show" do
    get member_results_show_url
    assert_response :success
  end

  test "should get new" do
    get member_results_new_url
    assert_response :success
  end
end
