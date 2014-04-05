class Category < ActiveRecord::Base
  attr_accessible :chinese_name, :french_name, :id, :order_no, :parent_id, :published

  has_many :user_categories, dependent: :destroy
  has_many :users, through: :user_categories
  has_many :articles, dependent: :destroy, order:"created_at desc"

  validates :chinese_name, presence: true, length:{maximum: 20}
  validates :french_name, presence: true, length:{maximum: 50}
  validates_uniqueness_of :chinese_name
  validates_uniqueness_of :french_name

  after_create :set_to_admin

  def submenus
    Category.where(parent_id: self.id).order(:order_no)
  end

  def parent_menu
    Category.where(id: self.parent_id).first
  end

  def self.except_me(my_id)
    if my_id.nil?
      self.all
    else
      self.where("id <> #{my_id}") 
    end
  end
  def published_submenus
    Category.where(parent_id: self.id, published: true)
  end
  
  private

  	def set_to_admin
  	  users = User.where(role: "admin")
  	  users.each do |user|
  	    user.categories << self
  	  end
  	end
end


