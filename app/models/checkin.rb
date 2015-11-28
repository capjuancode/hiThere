class Checkin < ActiveRecord::Base

  belongs_to :user

  after_save :addUserToGroup

  def addUserToGroup
    user=User.find(self.user_id)
    user.checkin_id = self.id
    user.save
  end
  
end
