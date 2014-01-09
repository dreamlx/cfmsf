require "spec_helper.rb"

describe User do
  it "has a valid factory" do
  	expect(build(:admin)).to be_valid
  	expect(build(:editor)).to be_valid
  end

  it "has all category when role is admin" do
  	news = create(:news)
  	life = create(:life)
  	tech = create(:tech)
  	admin = create(:admin)
  	expect(admin.categories).to eq [news,life,tech]
  end
end