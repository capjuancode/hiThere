class Checkin < ActiveRecord::Base

  belongs_to :user
  has_many :groups, dependent: :destroy
  has_many :grouping_table, dependent: :destroy

  after_save :addUserToGroup

  def addUserToGroup
    user=User.find(self.user_id)
    user.checkin_id = self.id
    user.save
  end

end
