require "test_helper"

class ReserveRoomControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reserve_room_index_url
    assert_response :success
  end

  test "should get confirm" do
    get reserve_room_confirm_url
    assert_response :success
  end

  test "should get show" do
    get reserve_room_show_url
    assert_response :success
  end
end
