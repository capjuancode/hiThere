class Camara < ActiveRecord::Base

  has_attached_file :img,
    :styles => {large:"960x960", medium: "720x720", thumb: "300x300" },
    :storage => :s3,
    :bucket => ENV['S3_BUCKET_NAME'],
    :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\Z/
  belongs_to :user
  has_many :reviews, dependent: :destroy

end
