class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :camaras
  has_many :checkins
  has_many :groups, :through => :checkins
  #
  # after_save :addUserToGroup
  #
  # def addUserToGroup
  #   user=User.find(self.user_id)
  #   user.checkin_id = self.id
  #   user.save
  # end
  #
end
