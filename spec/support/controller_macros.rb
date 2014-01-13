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

  def sign_in(user)
    before(:each) do
      visit "/users/sign_in"
      fill_in "Login", with: user.username
      fill_in "Password", with: user.password

      click_button "Sign in"
    end
  end
end