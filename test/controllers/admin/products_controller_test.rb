require 'test_helper'

class Admin::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_products_new_url
    assert_response :success
  end

end
