#!/bin/env ruby
# encoding: utf-8
module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in FactoryGirl.create(:admin) # Using factory girl as an example
    end
  end

  def login_editor
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:editor]
      user = FactoryGirl.create(:editor)
      sign_in user
    end
  end

  def sign_in_admin
    before(:each) do
      @user = FactoryGirl.create(:admin)
      visit "/users/sign_in"
      fill_in "user[login]", with: @user.username
      fill_in "user[password]", with: @user.password

      click_button "登录"
    end
  end

  def sign_in_editor
    before(:each) do
      @user = FactoryGirl.create(:editor)
      visit "/users/sign_in"
      fill_in "user[login]", with: @user.username
      fill_in "user[password]", with: @user.password

      click_button "登录"
    end
  end
end