require 'test_helper'

class Admin::CareersControllerTest < ActionController::TestCase
  setup do
    @admin_career = admin_careers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_careers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_career" do
    assert_difference('Admin::Career.count') do
      post :create, admin_career: {  }
    end

    assert_redirected_to admin_career_path(assigns(:admin_career))
  end

  test "should show admin_career" do
    get :show, id: @admin_career
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_career
    assert_response :success
  end

  test "should update admin_career" do
    put :update, id: @admin_career, admin_career: {  }
    assert_redirected_to admin_career_path(assigns(:admin_career))
  end

  test "should destroy admin_career" do
    assert_difference('Admin::Career.count', -1) do
      delete :destroy, id: @admin_career
    end

    assert_redirected_to admin_careers_path
  end
end
