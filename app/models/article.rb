class Article < ActiveRecord::Base
  attr_accessible :category_id, :chinese_title, :french_title,
                  :chinese_content, :french_content, :status
  belongs_to :category

  before_save :default_status

  validates :chinese_title, length:{maximum: 200}
  validates :french_title, length: {maximum: 200}
  validates :category_id, presence: true

  def default_status
  	self.status ||= 'pending'
  end

  def self.search_by_title(title)
    self.where("chinese_title like ? or french_title like ?", "%#{title}%", "%#{title}%")
  end
end

