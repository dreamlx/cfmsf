require 'spec_helper'

describe Category do
  it "has a valid factory" do
  	expect(FactoryGirl.build(:category)).to be_valid
  end

  it "admin has self when create new" do
  	admin = create(:admin)
  	news = create(:news)
  	expect(admin.categories).to include news
  end
end