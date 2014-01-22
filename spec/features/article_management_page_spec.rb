#!/bin/env ruby
# encoding: utf-8
require 'spec_helper'

describe "article management page" do
  describe "Admin" , :js => true do
    sign_in_admin
    subject{page}

    describe "create article" do
      before :each do
        visit new_admin_article_path
      end

      describe "title char is shorter 200" do
        before do
          @article = Article.new
          fill_in 'article[chinese_title]', with: "chinese_title"
          fill_in 'article[chinese_content]', with: "chinese_content"
          find_field('article[category_id]').find("option[value='1']").click
          click_button '创建文章'
        end
        it "should create success" do
          should have_content("文章创建成功")
        end
      end

      describe "title char is longer 200" do
      	before do
          @article = Article.new
          long_chinese_title = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
          fill_in 'article[chinese_title]', with: long_chinese_title
          fill_in 'article[chinese_content]', with: "chinese_content"
          find_field('article[category_id]').find("option[value='1']").click
          click_button '创建文章'
        end
        it "should create failed" do
          should have_content("中文标题太长")
        end
      end
    end

    it "delete article" do
      @article = FactoryGirl.create(:article, category_id: 1)
      visit edit_admin_article_path(@article)
      click_button '删除'
      should_not have_content(@article.chinese_title)
      should have_content('删除')
    end

    it "approve article" do
      @article = FactoryGirl.create(:article, category_id: 1)
      visit edit_admin_article_path(@article)
      click_button '通过'
      should have_content('文章发布成功')
    end
  end
  describe "Editor" do
    sign_in_editor
    before :all do
      # user.categories = Category.first
    end   
  end
end