class Article < ActiveRecord::Base
  attr_accessible :category_id, :chinese_title, :franch_title,
                  :chinese_content, :franch_content, :status
  belongs_to :category

  before_save :default_status

  validates :chinese_title, length:{maximum: 200}
  validates :franch_title, length: {maximum: 200}

  def default_status
  	self.status ||= 'pending'
  end

  def self.search_by_title(title)
    self.where("chinese_title like ? or franch_title like ?", "%#{title}%", "%#{title}%")
  end
end

