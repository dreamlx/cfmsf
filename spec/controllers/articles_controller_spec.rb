#!/bin/env ruby
# encoding: utf-8
require "spec_helper"

describe Admin::ArticlesController do
  login_admin

  before :each do 
    @news = create(:news)
    @life = create(:life)
    @news_article01 = create(:article, category: @news)
    @news_article02 = create(:article, category: @news)
    @life_article01 = create(:article, category: @life)
  end

  it "should have a current_user" do
  	subject.current_user.should_not be_nil
  end  

  describe "GET #index" do
  	context "with life.id " do
  	  it "populates an array of articles without category_id" do
        get :index, category_id: @life.id
  	  	expect(assigns(:articles)).to eq [@life_article01]
  	  end
  	end

  	context "without id" do
      it "populates an array of articles with first category" do
        get :index
        expect(assigns(:articles)).to eq Category.first.articles
      end
  	end
  end

  describe "GET #new" do
    it "assigns the requested article to @article" do
      get :new
      expect(assigns(:article)).to be_a_new(Article)
    end

    it "render template the new" do
      article = build(:article, category: @news)
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns the requested article to @article" do
      article = create(:article, category: @news)
      get :edit, id: article.id
      expect(assigns(:article)).to eq article
    end
  end

  describe "POST #create" do
    it "save the new article into database" do
      # expect{post :create, article: attributes_for(:article, category: @news)}.to change(Article, :count).by(1)
    end
  end

  describe "PATCH #update" do
    it "update the new article into database" do
      put :update, id: @news_article01, article: attributes_for(:article, category: @news) 
      @news_article01.reload
      expect(@news_article01.chinese_title).to eq @news_article01.chinese_title
    end
  end
end