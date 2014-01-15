class Category < ActiveRecord::Base
  attr_accessible :chinese_name, :french_name, :id

  has_many :user_categories, dependent: :destroy
  has_many :users, through: :user_categories
  has_many :articles, dependent: :destroy, order:"created_at desc"

  validates :chinese_name, presence: true, length:{maximum: 20}
  validates :french_name, presence: true, length:{maximum: 50}
  validates_uniqueness_of :chinese_name
  validates_uniqueness_of :french_name

  after_create :set_to_admin


  def self.get_id_by_name(french_name)
    self.where(french_name: french_name).first.nil? ? nil : self.where(french_name: french_name).first.id
  end


  private

  	def set_to_admin
  	  users = User.where(role: "admin")
  	  users.each do |user|
  	    user.categories << self
  	  end
  	end
end


