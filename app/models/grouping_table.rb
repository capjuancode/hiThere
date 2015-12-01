class GroupingTable < ActiveRecord::Base
  has_many :users
  has_many :groups
  has_many :checkins

  after_save :add_to_user

  def add_to_user
    current_user=User.find(self.user_id)
    current_user.group_id=self.group_id
    current_user.save
  end
end
