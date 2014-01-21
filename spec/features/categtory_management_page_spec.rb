# require "spec_helper"

# describe "category management" do
#   let(:life){build(:life)}
#   let(:tech){build(:tech)}
#   let(:news){build(:news)}
#   describe "Admin access" do
#     subject{page}
#     admin = User.create(username:"admin",password:"admin",role:"admin")
#     sign_in(admin)

#     describe "can new category" do
#       before{visit new_admin_category_path}
#       it{should have_button("Create Category")}
#     end

#     describe "can create Category" do
#       before{
#         visit new_admin_category_path
#         fill_in "Category CHN Name", with: life.chinese_name 
#         fill_in "Category FR Name", with: life.french_name 
#       }
#       it{ expect{click_button "Create Category"}.to change(Category,:count).by(1) }
#     end
      
#     it "can update" do
#       before {
#         visit edit_admin_category_path(life)
#         fill_in "Category CHN Name", with: tech.chinese_name
#       }
#     end
#     it "can delete"
#   end

#   describe "Editor access"

#   # describe "add category" do
#   #   describe "main page" do
#   #     subject{page}
#   #     before do
#   #     	visit admin_home_index_path
#   #     	click_link "Category Management"
#   #     end
#   #     it{should have_content("New Category")}
#   #   end
#   # end
# end