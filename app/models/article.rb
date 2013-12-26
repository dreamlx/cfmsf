class Article < ActiveRecord::Base
  attr_accessible :category_id, :chinese_title, :franch_title,
                  :chinese_content, :franch_content, :status
  belongs_to :category
  validates :status, presence: true

  after_create :set_default_status

  def set_default_status
  	self.status = "pending"
  end
end

