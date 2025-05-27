require "test_helper"

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_index_url
    assert_response :success
    assert_select ".dropdown", 1
    assert_select ".price", /\d{1,3}(?:\s\d{3})*,\d{2}\sруб\./
  end
end
