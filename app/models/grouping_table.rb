class GroupingTable < ActiveRecord::Base
  has_many :users
  has_many :groups
  has_many :checkins
end
