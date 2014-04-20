class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  attr_accessible :password, :password_confirmation, :remember_me, :username, :role, :login, :email
  attr_accessor :login

  validates :role, presence: true
  validates :email, presence: true
  validates :username, presence: true, length:{maximum: 10, minimum: 4}
  validates :username,
    :uniqueness => {
      :case_sensitive => false
    }

  has_many :user_categories
  has_many :categories, through: :user_categories
  has_many :articles, through: :categories

  after_create :set_admin_categories

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def set_admin_categories
    if self.role == "admin"
      categories = Category.all
      self.categories << categories
    end
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end
end