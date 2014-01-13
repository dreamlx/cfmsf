require 'spec_helper'

describe Admin::CategoriesController do
  before :each do
    @news = create(:news)
    @tech = create(:tech)
    @life = create(:life)
    @editor = create(:editor)
  end

  describe "administrator access" do
  	login_admin
	describe "get #index" do
  	  it "populates an array of result " do
  	  	get :index
  	  	expect(assigns(:categories)).to eq [@news,@tech,@life]
  	  	expect(session[:flash]).to eq nil
  	  end
  	end
  end

  describe "editor access" do
  	# login_editor
  	describe "get #index" do
  	  it "populates an array of result " do
  	    get :index
  	  	expect(session[:flash].alert).to eq "You are not authorized to access this page."
  	  end
  	end
  end

end
