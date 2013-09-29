class Logo < ActiveRecord::Base

  validates_presence_of :title
  validates_presence_of :logo

  mount_uploader :logo, LogoUploader

end
