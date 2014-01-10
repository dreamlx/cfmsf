#!/bin/env ruby
# encoding: utf-8

require 'faker'

FactoryGirl.define do
  factory :category do
  	french_name {Faker::Name.last_name}
  	factory :news do
  	  chinese_name "新闻"
  	end
  	factory :tech do
  	  chinese_name "科技"
  	end
  	factory :life do
  	  chinese_name "生活"
  	end
  end
end