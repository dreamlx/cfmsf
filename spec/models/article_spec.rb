#!/bin/env ruby
# encoding: utf-8
require "spec_helper"

describe Article do
  let(:news){ create(:news)}
  let(:tech){ create(:tech)}
  let(:life){ create(:life)}
  it "has a valid factory" do
  	expect(build(:article, category: news)).to be_valid
  end

  it "should default status is pendint" do
  	article = create(:article, category: life)
  	expect(article.status).to eq "pending"
  end

  describe "filter by title" do
  	before :each do
  	  @article01 = create(:article, chinese_title: "新闻", french_title: "new", category: news)
  	  @article02 = create(:article, chinese_title: "科技是什么", french_title:"what is tech?", category: tech)
  	  @article03 = create(:article, chinese_title: "生活是什么", french_title:"what is life?", category: life)
  	end

  	context "matching title by title" do
  	  it "return a sorted array of result that match chinese_title" do
  	    expect(Article.search_by_title("什么")).to eq [@article02, @article03]
  	  end
  	  it "return a sorted array of result that match french_title" do
  	  	expect(Article.search_by_title("what")).to eq [@article02, @article03]
  	  end
  	end

  	context "non-matching title by title" do
  	  it "return a sorted array of result that match chinese_title" do
  	    expect(Article.search_by_title("什么")).to_not include @article01
  	  end
  	  it "return a sorted array of result that match french_title" do
  	  	expect(Article.search_by_title("what")).to_not include @article01
  	  end
  	end
  end
end