class Life < ActiveRecord::Base
  attr_accessible :title, :content, :author, :tag_list
  acts_as_taggable
  paginates_per 10

  has_many :comments

  def prev
  	Life.where("id < ?", self.id).order("id DESC").first
  end

  def next
  	Life.where("id > ?", self.id).order("id ASC").first
  end

  private
    def self.find_by_month(month)
      where('extract(month from created_at ) = ?', month)
    end
end
