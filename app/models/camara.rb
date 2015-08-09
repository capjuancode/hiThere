class Camara < ActiveRecord::Base

  has_attached_file :img, :styles => {large:"600x600", medium: "300x300", thumb: "150x150" }
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\Z/
  belongs_to :user
  has_many :reviews, dependent: :destroy
end
