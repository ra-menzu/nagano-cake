require 'test_helper'

class Admin::GuestsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_guests_new_url
    assert_response :success
  end

end
