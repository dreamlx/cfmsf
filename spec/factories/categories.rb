#!/bin/env ruby
# encoding: utf-8

require 'faker'

FactoryGirl.define do
  factory :category do
  	factory :news do
  	  chinese_name "新闻"
      french_name "news"
  	end
  	factory :tech do
  	  chinese_name "科技"
      french_name "tech"
  	end
  	factory :life do
  	  chinese_name "生活"
      french_name "life"
  	end
  end
end