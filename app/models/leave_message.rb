class LeaveMessage < ActiveRecord::Base
  attr_accessible :name, :email, :website, :comment
end
