require "spec_helper"
require "cancan/matchers"


describe User do
  let(:news){create(:news)}
  let(:life){create(:life)}
  let(:tech){create(:tech)}
  let(:life_article){create(:article, category: life)}
  let(:tech_article){create(:article, category: tech)}
  let(:news_article){create(:article, category: news)}

  it "has a valid factory" do
  	expect(build(:admin)).to be_valid
  	expect(build(:editor)).to be_valid
  end

  it "has all category when role is admin" do
  	
  	admin = create(:admin)
  	expect(admin.categories).to eq [news,life,tech]
  end

  describe "ability" do
    describe "administrator access" do
      subject(:ability){ Ability.new(admin) }
      let(:admin){create(:admin)}
      it{should be_able_to(:manage, :all)}
      it{should_not be_able_to(:approve, create(:article, status: "public", category: life))}
      it{should_not be_able_to(:reject, create(:article, status:"pending", category: life))}
      it{should_not be_able_to(:edit, create(:article, status:"deleted", category: life))}
      it{should_not be_able_to(:update, create(:article,status: "deleted", category: life))}
    end

    describe "editory access" do
      subject(:ability){Ability.new(editor)}
      let(:editor){create(:editor)}
      let(:user_category){create(:user_category, user_id: editor.id, category_id: life_id)}

      describe "category" do
        it{should_not be_able_to(:manage, Category)}
      end

      describe "user" do
        it{should_not be_able_to(:manage, User)}
      end

      describe "article" do
        # it{should_not be_able_to(:delete, Article)}
        
        context "should manage article" do
          it{should_not be_able_to([:update,:create, :edit], tech_article)} 
          it{should_not be_able_to(:new, Article.new(category_id: tech.id))}
        end
      end
    end
  end
end
