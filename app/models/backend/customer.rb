require 'open-uri'

class Backend::Customer < ActiveRecord::Base

  has_attached_file :photo, :styles => {:thumb => "100x100>"}
  validates_attachment_content_type :photo, :content_type => %w(image/jpeg image/jpg image/png)

  has_many :backend_education, class_name: Backend::Education, foreign_key: 'backend_customer_id'
  has_many :backend_position, class_name: Backend::Position, foreign_key: 'backend_customer_id'


  def photo_from_url(url)
    self.photo = open(url)
  end

end
