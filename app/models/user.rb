class User < ActiveRecord::Base
  has_many :articles
  has_many :comments
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  has_secure_password
end
