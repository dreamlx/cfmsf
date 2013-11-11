class Comment < ActiveRecord::Base
  attr_accessible :name, :email, :website, :content, :life_id
  paginates_per 12

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates_presence_of :email, message: "Email is not blank"
  validates :email, format: { with: VALID_EMAIL_REGEX, message: "Email format is not true"}
  validates_presence_of :name, message: "Name is not blank"
  validates :name, length: {maximum: 20, message: "The max length is 20"}

  belongs_to :life
end
