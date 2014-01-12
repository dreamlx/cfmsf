require "spec_helper"

describe "category management" do
  describe "add category" do
    admin = User.create(username:"admin",password:"admin",role:"admin")
  	login_in(admin)
    describe "main page" do
      subject{page}
      before do
      	visit root_path
      	click_link "Category Management"
      end
      it{should have_content("New Category")}
    end
  end
end