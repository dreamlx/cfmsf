require 'test_helper'

class Admin::LeaveMessagesControllerTest < ActionController::TestCase
  setup do
    @admin_leave_message = admin_leave_messages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_leave_messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_leave_message" do
    assert_difference('Admin::LeaveMessage.count') do
      post :create, admin_leave_message: {  }
    end

    assert_redirected_to admin_leave_message_path(assigns(:admin_leave_message))
  end

  test "should show admin_leave_message" do
    get :show, id: @admin_leave_message
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_leave_message
    assert_response :success
  end

  test "should update admin_leave_message" do
    put :update, id: @admin_leave_message, admin_leave_message: {  }
    assert_redirected_to admin_leave_message_path(assigns(:admin_leave_message))
  end

  test "should destroy admin_leave_message" do
    assert_difference('Admin::LeaveMessage.count', -1) do
      delete :destroy, id: @admin_leave_message
    end

    assert_redirected_to admin_leave_messages_path
  end
end
