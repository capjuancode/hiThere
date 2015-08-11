class Camara < ActiveRecord::Base

  has_attached_file :img, :styles => {large:"960x960", medium: "720x720", thumb: "300x300" }
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\Z/
  belongs_to :user
  has_many :reviews, dependent: :destroy
end
