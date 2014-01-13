require 'spec_helper'

describe Category do
  it "has a valid factory" do
  	expect(FactoryGirl.build(:news)).to be_valid
  	expect(FactoryGirl.build(:life)).to be_valid
  	expect(FactoryGirl.build(:tech)).to be_valid
  end

  it "admin has self when create new" do
  	admin = create(:admin)
  	news = create(:news)
  	expect(admin.categories).to include news
  end
end