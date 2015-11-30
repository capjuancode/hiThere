class Group < ActiveRecord::Base
  belongs_to :checkin
  has_many :grouping_table
end
