require 'faker'

FactoryGirl.define do
  factory :user do
  	password   "11111111"
    email      "me@example.com"
  	factory :admin do
    	username "admin01"
  	  role     "admin"
  	end

  	factory :editor do
  	  username "editor"
      role     "editor"
  	end  	
  end
end