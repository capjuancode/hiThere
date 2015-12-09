class GroupingTable < ActiveRecord::Base
  has_many :users
  has_many :groups
  has_many :checkins

  before_save :add_to_user
  before_create :check_user

  def add_to_user
    current_user=User.find(self.user_id)
    current_user.group_id=self.group_id
    current_user.save
  end

  def check_user
    current_user=User.find(self.user_id)
    GroupingTable.find_by_checkin_id_and_group_id_and_user_id(current_user.checkin_id,current_user.group_id,current_user.id) == nil


  end
end
