require 'test_helper'

class SiteControllerTest < ActionController::TestCase
  test "should get projects" do
    get :projects
    assert_response :success
  end

end
